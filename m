Content-Type: multipart/mixed; boundary="===============1233090653551762345=="
MIME-Version: 1.0
From: Fangrui Song <maskray@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [dhowells-fs:fscache-netfs-lib 11/24] aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/fscache/page2.o' being placed in section `.eh_frame'
Date: Tue, 19 Jan 2021 13:54:34 -0800
Message-ID: <20210119215434.gu6bdrh343bjitxy@google.com>
In-Reply-To: <189650.1611049599@warthog.procyon.org.uk>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1233090653551762345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-01-19, David Howells wrote:
>kernel test robot <lkp@intel.com> wrote:
>
>> >> aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/fs=
cache/page2.o' being placed in section `.eh_frame'
>
>Is this a Clang bug?
>
>David

This is similar to https://github.com/ClangBuiltLinux/linux/issues/1227

Either .eh_frame : { *(.eh_frame) } should be used or -fno-asynchronous-unw=
ind-tables is missing in some places.
--===============1233090653551762345==--

