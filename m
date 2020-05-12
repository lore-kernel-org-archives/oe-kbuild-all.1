Content-Type: multipart/mixed; boundary="===============6887021913116788808=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [ath6kl:pending 21/24] drivers/net/wireless/ath/ath11k/pci.c:49:34: warning: Local variable 'msi_config' shadows outer variable [shadowVariable]
Date: Tue, 12 May 2020 11:11:56 +0800
Message-ID: <202005121153.gLRyf9Tw%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6887021913116788808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pendi=
ng
head:   6303acc5b03a5fc3bf6cf5fa072ae0dc9aaa5dd0
commit: 398a800c183de17a49a5779550e72fbc3ba1e592 [21/24] ath11k: Add msi co=
nfig init for QCA6390

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath11k/pci.c:49:34: warning: Local variable 'ms=
i_config' shadows outer variable [shadowVariable]
    const struct ath11k_msi_config *msi_config;
                                    ^
   drivers/net/wireless/ath/ath11k/pci.c:23:39: note: Shadowed declaration
   static const struct ath11k_msi_config msi_config =3D {
                                         ^
   drivers/net/wireless/ath/ath11k/pci.c:49:34: note: Shadow variable
    const struct ath11k_msi_config *msi_config;
                                    ^

vim +/msi_config +49 drivers/net/wireless/ath/ath11k/pci.c

    45	=

    46	static int ath11k_pci_enable_msi(struct ath11k_pci *ab_pci)
    47	{
    48		struct ath11k_base *ab =3D ab_pci->ab;
  > 49		const struct ath11k_msi_config *msi_config;
    50		struct msi_desc *msi_desc;
    51		int num_vectors;
    52		int ret;
    53	=

    54		ret =3D ath11k_pci_get_msi_assignment(ab_pci);
    55		if (ret) {
    56			ath11k_err(ab, "failed to get MSI assignment, err =3D %d\n", ret);
    57			goto out;
    58		}
    59	=

    60		msi_config =3D ab_pci->msi_config;
    61		if (!msi_config) {
    62			ath11k_err(ab, "msi_config is NULL!\n");
    63			ret =3D -EINVAL;
    64			goto out;
    65		}
    66	=

    67		num_vectors =3D pci_alloc_irq_vectors(ab_pci->pdev,
    68						    msi_config->total_vectors,
    69						    msi_config->total_vectors,
    70						    PCI_IRQ_MSI);
    71		if (num_vectors !=3D msi_config->total_vectors) {
    72			ath11k_err(ab, "failed to get enough MSI vectors (%d), available v=
ectors =3D %d",
    73				   msi_config->total_vectors, num_vectors);
    74			if (num_vectors >=3D 0)
    75				ret =3D -EINVAL;
    76			goto reset_msi_config;
    77		}
    78	=

    79		msi_desc =3D irq_get_msi_desc(ab_pci->pdev->irq);
    80		if (!msi_desc) {
    81			ath11k_err(ab, "msi_desc is NULL!\n");
    82			ret =3D -EINVAL;
    83			goto free_msi_vector;
    84		}
    85	=

    86		ab_pci->msi_ep_base_data =3D msi_desc->msg.data;
    87	=

    88		ath11k_dbg(ab, ATH11K_DBG_PCI, "msi base data is %d\n", ab_pci->msi=
_ep_base_data);
    89	=

    90		return 0;
    91	=

    92	free_msi_vector:
    93		pci_free_irq_vectors(ab_pci->pdev);
    94	reset_msi_config:
    95		ab_pci->msi_config =3D NULL;
    96	out:
    97		return ret;
    98	}
    99	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6887021913116788808==--

