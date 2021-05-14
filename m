Content-Type: multipart/mixed; boundary="===============7938385453125759515=="
MIME-Version: 1.0
From: Will Deacon <will@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 2/2] KVM: arm64: Mark the host stage-2 memory pools static
Date: Fri, 14 May 2021 11:09:41 +0100
Message-ID: <20210514100941.GA3795@willie-the-truck>
In-Reply-To: <20210514085640.3917886-3-qperret@google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7938385453125759515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2021 at 08:56:40AM +0000, Quentin Perret wrote:
> The host stage-2 memory pools are not used outside of mem_protect.c,
> mark them static.
> =

> Fixes: 1025c8c0c6ac ("KVM: arm64: Wrap the host with a stage 2")
> Reported-by: Reported-by: kernel test robot <lkp@intel.com>

^^^ nit, but this tag has gone wonky.

Will
--===============7938385453125759515==--

