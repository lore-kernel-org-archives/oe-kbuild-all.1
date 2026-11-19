Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059203;
	b=QRR2SoyVlS+qLnPA/CI840Gm1dqIT5d2Gstpbq3T6M/mnq4XaZtN9fu3JYQauHgHClLO
	 gDzYSEbuks2pbDK1TL8O1cqD10g4xd2zFmh3eYxQ5jtsEkXYDw+Nd8aNGZfuK9+aAVN+x
	 nHcE7BpZvDIj0TxQQQ0nYrmTNc8BODQwTswF1D6Xa4faCkbze8pVWkM+p37u9CYbGJHYH
	 /rCajx555eN1P4Vff2Akc91UIeXKp5/kCs7iY4dKsXUITPcHDY18Rg7lkmsvzbguUVuUu
	 CDECGONgFGh6eWqm4M3mFBCK7Dk8eXU8YdyNN4JsE6QSqR24LVUf4d0mwZrSqAuWOhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059203;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zzRiFpdUasX5LRBDaXU+vUVx3VtT1pfTYM2jCIf+zAI=;
	b=3WdYvhNpM75AQbbNA4YFTi9V3ANg6/08Zoa+QkhErkZDWXJHsDHX7ypyACj/r3jhS5Ys
	 1dOFF+i7roHV0CzhpJuQdlG+cOiVGafzXQ24gn13lxfLZM7DKYUgj22V2KgwrY+e9kCRv
	 yVev5kApp6iNtBOP2BFTVEdJnXsqrOKmGuhVRVEY6sSnJfgrP1K3NePK9g3cWAnRXLhm/
	 3cp19Kl+9RDmIARTK9YK2i3qz3NbYLbWUkD7+tFxlJM57+s4yjoRTFZ6BhxCvPAWYdt4/
	 PlnnVPbEdsv0sDfhYvvvMU61pO/8Hyl6x47AzliqamfdTjXzaYGZhqGlwVJd6XMMRWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cl40T8+l;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD50606A32F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 03:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CD50606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cl40T8+l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795059203; x=1826595203;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=srV11EXjOJzPlp4PeBMhj5mXDiK4WsHDASZ8BZjyy8M=;
  b=cl40T8+lmyihgKGWYHoqNPqf1bMDhxR5qkxMey7JOz7zFjisuAIT45Dw
   m+iLkR53ZDl04g3k3Jo6RAGoVIx/a4VwjzPB75zhxgoxdEBAzTUw+NCDQ
   gdqZS+162PNOezsUScskqCU5AK93IJknUgOe4kKi1z+hXZQCwJj76dd5E
   rqAuIXKpbkW8HAXdUjyMVHd4q3CHwDdS+AV/Jg4KajVV6uQHVhV/xoyLQ
   dVB2Qvv+B06T6bzNNW5ANvI+xy2WFAAWyqEVMQb64bJJc+WMssCPqWqGd
   LsF6qCFP7gGcCk/dMdRJ0ii2WHJavp+kX5nFOBRrvpQx8JgShauY8UdlV
   Q==;
X-CSE-ConnectionGUID: sKdbKYNvTi2nlpC8d2OR6g==
X-CSE-MsgGUID: mpD1qlNeSVKpbFxzGEP81g==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3907770"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3907770"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 19:33:19 -0800
X-CSE-ConnectionGUID: Q3pP4CiISY2MdZfhDZ7LIg==
X-CSE-MsgGUID: TaQsrP3XSSmpVyy+yEAoRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10703921"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 18 Nov 2026 19:33:18 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTstf-000000003du-1ooj;
	Thu, 19 Nov 2026 03:33:15 +0000
Date: Thu, 19 Nov 2026 04:33:02 +0100
From: kernel test robot <lkp@intel.com>
To: Konstantin Taranov <kotaranov@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>
Subject: drivers/infiniband/hw/mana/device.c:72:28: sparse: sparse:
 symbol 'mana_ib_dev_dm_ops' was not declared. Should it be static?
Message-ID: <20261119042946.4dJuxy2K-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
commit: a01745ccf7c41043c503546cae7ba7b0ff499d38 RDMA/mana_ib: Add device=
=E2=80=91memory support
date:   10 months ago
config: arm64-randconfig-r2305-20261119 (https://download.01.org/0day-ci/ar=
chive/20261119/20261119042946.4dJuxy2K-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261119/20261119042946.4dJuxy2K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: a01745ccf7c4 ("RDMA/mana_ib: Add device=E2=80=91memory support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119042946.4dJuxy2K-lkp=
@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/hw/mana/device.c:72:28: sparse: sparse: symbol 'mana_=
ib_dev_dm_ops' was not declared. Should it be static?

vim +/mana_ib_dev_dm_ops +72 drivers/infiniband/hw/mana/device.c

    71=09
  > 72	const struct ib_device_ops mana_ib_dev_dm_ops =3D {
    73		.alloc_dm =3D mana_ib_alloc_dm,
    74		.dealloc_dm =3D mana_ib_dealloc_dm,
    75		.reg_dm_mr =3D mana_ib_reg_dm_mr,
    76	};
    77=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
