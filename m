Content-Type: multipart/mixed; boundary="===============2367271093739878710=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 952/3956] crypto/blake2b_generic.c:73:13: warning: stack frame size of 9776 bytes in function 'blake2b_compress_one_generic'
Date: Sat, 16 Jan 2021 16:36:44 +0100
Message-ID: <CAK8P3a1FTzwK=xK2eC5hiBSC+Xjq1eNO_cv3=CRB4csNiMpsUA@mail.gmail.com>
In-Reply-To: <YAJIhjzmvszXAXUb@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2367271093739878710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 16, 2021 at 2:59 AM Eric Biggers <ebiggers@kernel.org> wrote:
> On Sat, Jan 16, 2021 at 08:59:50AM +0800, kernel test robot wrote
>
> Looks like the clang bug that causes large stack usage in this function
> (https://bugs.llvm.org/show_bug.cgi?id=3D45803 which is still unfixed) got
> triggered again.  Note that the function only has 264 bytes of local vari=
ables,
> so there's no reason why it should use anywhere near 9776 bytes of stack =
space.
>
> I'm not sure what we can do about this.  Last time the solution was commit
> 0c0408e86dbe which randomly added a 'pragma nounroll' to the loop at the =
end.
>
> Anyone have any better idea than randomly trying adding optimization prag=
mas and
> seeing what makes the report go away?
>
> Also this was reported with clang 12.0.0 which is a prerelease version, s=
o I'm
> not sure how much I'm supposed to care about this report.

I sent a workaround to disable UBSAN_UNSIGNED_OVERFLOW an
x86-32, after showing that this did not affect arm32, arm64 or x86-64:
27c287b41659 ("ubsan: disable unsigned-overflow check for i386")

As the report is for ppc64, it appears that this is not just specific to x8=
6-32
after all. I have had no success in isolating the problem in clang, but I
did not try too hard either. I see this .config also enables
CONFIG_UBSAN_UNSIGNED_OVERFLOW=3Dy, so it would be a
reasonable assumption that this is the same problem as on x86-32.

There is also another thread on CONFIG_UBSAN_UNSIGNED_OVERFLOW
causing BUILD_BUG_ON() failures.

        Arnd
--===============2367271093739878710==--

