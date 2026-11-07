Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036739;
	b=TADOZ6aiQPVT/ftiQMzgMELoJ2y7Lfw0XR59Kz6xpM7A/SjT/dQ3X0hsr180KlTm2vGX
	 HSleJ8haFAW2TZj9W2eRjL796C9pIc9RtvA8IJxVH6ydYnCvLVyq9rSJIKmK5XMJKXFGv
	 a9BEEkEdQtnR+T6dyIf1cK4+AyH4mjG1O6lpzwtn3ckXTI3AicVGyxMZEe8IXd6JQh5OC
	 KeZgHEtxfylXvm+BJbVzAaKhclcn8+7kvnAYqm6eqx/G+g7Z20BgXcpDhfi44lOv4MoSH
	 8wXUZy+ec1lzjZ2HFfL44pVHj5OfkETzgx4To2gw8CGP/WO2xXmRu39DbvRnO6cuO+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036739;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NPDAoUaRmzG67tw2Qx7KiS4B7Z3A5aBcjuuZXwZMj60=;
	b=ZxQUMH2kbubzBVOGgl1+BxmlHadP6Zl9qmstyeLvkK1+/jQTqUYq0wxF3bBoRvFd0vJ9
	 et0S/pFU73DSmm6sFwrm9c7hNW0QSeDSmYLNWG3BNnj07+w/Bw8vuCcL1O/7TFZnTB/FJ
	 lXYyWrJiFL2M56O2OiGQDm8FuDAkae9lt+eJHxZ+pJhz8nptRtD3a+3XzixUI9p3/8N2M
	 D4t0qdhOI7Og+a2bnfhuPJUbzVjOye4VPK29lByB6Bhgr3nnzHehRRCrSWhb0TMFtq0mI
	 JWV5Ty4r4Q00pJn+2FTPIuafl0/KgzZVORFIVrrICMOtLNsO9eHr9KNgKd6DT3T33bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AIMwiGD3;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBAA606A326
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 07:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EBAA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AIMwiGD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794036737; x=1825572737;
  h=date:from:to:cc:subject:message-id;
  bh=xsI3O8BL4rysso3LssDClPze948/NZPEcK668/0H2fs=;
  b=AIMwiGD3WcVdg1fg3gdzoNXM2pg8p9xIdpEJKUu2VARUoBKwpDTi1H1O
   g9aN+k3xmXGe7jxpxpSv+nq1ByiL7X7kfDq4o816/q4zZJu4oR1mwyd0l
   hnOmfqCNXA9iUqT+87mzioJTeY2Eb+Cl3c8GOd/hx12CsGT+0LwK8fIlZ
   +HqUmeKqzZtlviiwA5YvGZvEpb2RHXYBiddvGxpwQh8E4shO8eH94cWMm
   bb8dFFZY2uXfHD0Hcj91OXKz0Tcx/9hPZG8fO92qWvole7EoSJ+6Ahf1e
   po0yz8arGqsUNmTP0mE2eSZvho1cet24tflCv2DkufHcgqNgqQtHLN9df
   g==;
X-CSE-ConnectionGUID: pk83uXipT3uYJ83r41V9YQ==
X-CSE-MsgGUID: nM8u2dNqQIaPZEy/nOBw/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2880927"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2880927"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 23:32:17 -0800
X-CSE-ConnectionGUID: lvLlDMDOSc+g4QvciShjZg==
X-CSE-MsgGUID: AOPt9outQe2/CPhUoEYITA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7782213"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 06 Nov 2026 23:32:16 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPauL-00000000Ab5-2goa;
	Sat, 07 Nov 2026 07:32:13 +0000
Date: Sat, 07 Nov 2026 08:31:57 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 53/53]
 drivers/android/wrapfd.c:1128:9-16: WARNING: ERR_CAST can be used with dmabuf
Message-ID: <202611070855.aIo6ouv2-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   bc10f2ae3a89cd46c1069ed99b65df424ba3d3db
commit: 21a10439d541b2b001a7ad4c9812e346442df7e6 [53/53] ANDROID: wrapfd: consider write permissions of the file being wrapped
config: i386-randconfig-r2111-20261107 (https://download.01.org/0day-ci/archive/20261107/202611070855.aIo6ouv2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611070855.aIo6ouv2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/android/wrapfd.c:1128:9-16: WARNING: ERR_CAST can be used with dmabuf

vim +1128 drivers/android/wrapfd.c

  1119	
  1120	static struct wrap_content *create_content_for(int fd, unsigned long prot)
  1121	{
  1122		bool is_file_writable, writable;
  1123		struct wrap_content *content;
  1124		struct dma_buf *dmabuf;
  1125	
  1126		dmabuf = dma_buf_get(fd);
  1127		if (IS_ERR(dmabuf))
> 1128			return ERR_PTR(PTR_ERR(dmabuf));
  1129	
  1130		writable = !!(prot & PROT_WRITE);
  1131		is_file_writable = !!(dmabuf->file->f_mode & FMODE_WRITE);
  1132		if (writable && !is_file_writable)
  1133			content = ERR_PTR(-EACCES);
  1134		else
  1135			content = alloc_dmabuf_content(dmabuf, writable);
  1136		dma_buf_put(dmabuf);
  1137	
  1138		return content;
  1139	}
  1140	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
