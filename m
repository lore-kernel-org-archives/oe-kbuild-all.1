Content-Type: multipart/mixed; boundary="===============3723760798105723893=="
MIME-Version: 1.0
From: Quentin Perret <qperret@google.com>
To: kbuild-all@lists.01.org
Subject: [PATCH 0/2] KVM: arm64: Mark a couple of variables static
Date: Fri, 14 May 2021 08:56:38 +0000
Message-ID: <20210514085640.3917886-1-qperret@google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3723760798105723893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The kernel test bot is complaining (and rightfully so) about variables
introduced by the host stage-2 series that should be static. This series
fixes all of them.

Thanks!

Quentin Perret (2):
  KVM: arm64: Mark pkvm_pgtable_mm_ops static
  KVM: arm64: Mark the host stage-2 memory pools static

 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 4 ++--
 arch/arm64/kvm/hyp/nvhe/setup.c       | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- =

2.31.1.751.gd2f1c929bd-goog

--===============3723760798105723893==--

