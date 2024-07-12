Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4632416F0C2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jul 2024 10:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720779775; cv=none; b=uBA+hA5m7pis8EzXc8gVshzvSKKVi/ZOj2K9QSOEwL+aQFUANN2Gt3ivAZ/+FB5+sUR4mNknSiIYMx+ogQQRYWlu8onebiI42msD5JEVTAtWeN4YK8JhxC3R0q+NBCxa3qZeZ3t/5DNbw+UKaMyRBDLIBjvBCD51BV3H1icumNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720779775; c=relaxed/simple;
	bh=hT9KYayQoZMuriArnvelrFa3Fs9eteN6/eNv3aXYLNQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d4/sP/wIhwSZGjpYuJQQ+C770mowg4XQdu3wr1+8oyA4q21NCkAyb7Tog7Ygcvx/yXYwzatzy5eIxpbRPTz21KrmycAc661ifK2yBTZ2BXSgGSMAGfHw+DHP6VvHva0bauN3rcCsgM7rTQyswfQP672V6rKWLsZo5/LhJQp3u8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WL70s64tFz6K5t9;
	Fri, 12 Jul 2024 18:21:17 +0800 (CST)
Received: from lhrpeml500002.china.huawei.com (unknown [7.191.160.78])
	by mail.maildlp.com (Postfix) with ESMTPS id 89046140B2A;
	Fri, 12 Jul 2024 18:22:49 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 lhrpeml500002.china.huawei.com (7.191.160.78) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 11:22:49 +0100
Received: from lhrpeml500005.china.huawei.com ([7.191.163.240]) by
 lhrpeml500005.china.huawei.com ([7.191.163.240]) with mapi id 15.01.2507.039;
 Fri, 12 Jul 2024 11:22:49 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>, Jason Gunthorpe <jgg@nvidia.com>, "Kevin
 Tian" <kevin.tian@intel.com>
Subject: RE: [linux-next:master 9539/12880]
 drivers/iommu/io-pgtable-arm.c:772:50: error: 'IOMMU_DIRTY_NO_CLEAR'
 undeclared
Thread-Topic: [linux-next:master 9539/12880]
 drivers/iommu/io-pgtable-arm.c:772:50: error: 'IOMMU_DIRTY_NO_CLEAR'
 undeclared
Thread-Index: AQHa1DSGChJrAKxTUkKXF/6p5xqHYbHy4YEw
Date: Fri, 12 Jul 2024 10:22:49 +0000
Message-ID: <84de5d98f80f4890943eada39b795fec@huawei.com>
References: <202407121602.HL9ih1it-lkp@intel.com>
In-Reply-To: <202407121602.HL9ih1it-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0



> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Friday, July 12, 2024 9:21 AM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: oe-kbuild-all@lists.linux.dev; Linux Memory Management List <linux-
> mm@kvack.org>; Will Deacon <will@kernel.org>; Ryan Roberts
> <ryan.roberts@arm.com>; Jason Gunthorpe <jgg@nvidia.com>; Kevin Tian
> <kevin.tian@intel.com>
> Subject: [linux-next:master 9539/12880] drivers/iommu/io-pgtable-
> arm.c:772:50: error: 'IOMMU_DIRTY_NO_CLEAR' undeclared
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
> master
> head:   3fe121b622825ff8cc995a1e6b026181c48188db
> commit: 4fe88fd8b4aecb7f9680bf898811db76b94095a9 [9539/12880]
> iommu/io-pgtable-arm: Add read_and_clear_dirty() support
> config: arm-buildonly-randconfig-r005-20220402
> (https://download.01.org/0day-ci/archive/20240712/202407121602.HL9ih1it-
> lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> ci/archive/20240712/202407121602.HL9ih1it-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407121602.HL9ih1it-
> lkp@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    drivers/iommu/io-pgtable-arm.c: In function 'io_pgtable_visit_dirty':
> >> drivers/iommu/io-pgtable-arm.c:772:50: error:
> 'IOMMU_DIRTY_NO_CLEAR' undeclared (first use in this function)
>      772 |                         if (!(walk_data->flags & IOMMU_DIRTY_N=
O_CLEAR))

Looks like we need to move the IOMMU_DIRTY_NO_CLEAR define in iommu.h
to cover !CONFIG_IOMMU_API case.

---x---

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 7bc8dff7cf6d..104ce84647d4 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -317,6 +317,9 @@ enum iommu_dev_features {
 #define IOMMU_PASID_INVALID    (-1U)
 typedef unsigned int ioasid_t;

+/* Read but do not clear any dirty bits */
+#define IOMMU_DIRTY_NO_CLEAR (1 << 0)
+
 #ifdef CONFIG_IOMMU_API

 /**
@@ -353,9 +356,6 @@ struct iommu_dirty_bitmap {
        struct iommu_iotlb_gather *gather;
 };

-/* Read but do not clear any dirty bits */
-#define IOMMU_DIRTY_NO_CLEAR (1 << 0)
-
 /**
  * struct iommu_dirty_ops - domain specific dirty tracking operations
  * @set_dirty_tracking: Enable or Disable dirty tracking on the iommu doma=
in

I will sent out a patch.

Thanks,
Shameer


