Content-Type: multipart/mixed; boundary="===============7838390104072938828=="
MIME-Version: 1.0
From: Marc Zyngier <maz@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 0/2] KVM: arm64: Mark a couple of variables static
Date: Fri, 14 May 2021 10:33:33 +0100
Message-ID: <162098480497.2617215.5479779823421190391.b4-ty@kernel.org>
In-Reply-To: <20210514085640.3917886-1-qperret@google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7838390104072938828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 14 May 2021 08:56:38 +0000, Quentin Perret wrote:
> The kernel test bot is complaining (and rightfully so) about variables
> introduced by the host stage-2 series that should be static. This series
> fixes all of them.
> =

> Thanks!
> =

> Quentin Perret (2):
>   KVM: arm64: Mark pkvm_pgtable_mm_ops static
>   KVM: arm64: Mark the host stage-2 memory pools static
> =

> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: Mark pkvm_pgtable_mm_ops static
      commit: 8030d45936f2c526ace7b8404c8272239289b5b7
[2/2] KVM: arm64: Mark the host stage-2 memory pools static
      commit: 72799c362520f37abd929799190350e466890336

Cheers,

	M.
-- =

Without deviation from the norm, progress is not possible.


--===============7838390104072938828==--

