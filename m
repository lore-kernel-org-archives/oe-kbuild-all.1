Content-Type: multipart/mixed; boundary="===============7040796809948120283=="
MIME-Version: 1.0
From: Peter Xu <peterx@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v9 07/14] KVM: Don't allocate dirty bitmap if dirty ring is enabled
Date: Tue, 26 May 2020 11:21:52 -0400
Message-ID: <20200526152152.GA1194141@xz-x1>
In-Reply-To: <20200526150547.GC30967@xsang-OptiPlex-9020>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7040796809948120283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2020 at 11:05:47PM +0800, kbuild test robot wrote:
> >> arch/x86/kvm/mmu/mmu.c:1280:3: warning: Returning an integer in a func=
tion with pointer return type is not portable. [CastIntegerToAddressAtRetur=
n]
>      return false;
>      ^

A rebase accident for quite a few versions...  Fixed.

-- =

Peter Xu

--===============7040796809948120283==--

