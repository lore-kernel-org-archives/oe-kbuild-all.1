Content-Type: multipart/mixed; boundary="===============3556903355287586385=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-nvme:for-5.6 9/13] drivers/nvme/target/core.c:1455:9: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Thu, 06 Feb 2020 09:02:10 +0800
Message-ID: <202002060945.HKZfK29M%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3556903355287586385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/nvme.git for-5.6
head:   c8c98d699e88c3d809664e538f08e48fd9f786ce
commit: 8b65c0f872cd35ce33352cf51999c39f3dd9b28c [9/13] nvmet: make ctrl mo=
del configurable
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-154-g1dc00f87-dirty
        git checkout 8b65c0f872cd35ce33352cf51999c39f3dd9b28c
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/nvme/target/core.c:1455:9: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces)
>> drivers/nvme/target/core.c:1455:9: sparse:    expected struct callback_h=
ead *head
>> drivers/nvme/target/core.c:1455:9: sparse:    got struct callback_head [=
noderef] <asn:4> *

vim +1455 drivers/nvme/target/core.c

  1446	=

  1447	static void nvmet_subsys_free(struct kref *ref)
  1448	{
  1449		struct nvmet_subsys *subsys =3D
  1450			container_of(ref, struct nvmet_subsys, ref);
  1451	=

  1452		WARN_ON_ONCE(!list_empty(&subsys->namespaces));
  1453	=

  1454		kfree(subsys->subsysnqn);
> 1455		kfree_rcu(subsys->model, rcuhead);
  1456		kfree(subsys);
  1457	}
  1458	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3556903355287586385==--

