Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16C917BD9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 01:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733794858; cv=none; b=qtP2EFo5LPQoS0bvECz1h79osJoYOPWGA2S9RrYPBiTouFyxegBQTk77rZrqpmSeDSghSjRCOlXwxc0crcgSQpITEXfOSEtvn14Qmf/vqExCwliUYobkeAJcBnPPKeWbJyoQOKZAt5fxM0s5V0ugN7sFsxLygH1V6ZoNNfMV73Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733794858; c=relaxed/simple;
	bh=9TLB1vZxyO8jZrtpMnVC+PQYenlBfz/zv+70ort9P0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MCSqR27bqZWvz921sFmSPWn21yVR5dxBYATa4Fkf1nLaC4s9udjlBK0BHqFCjuOF5sAHCsTWAmvhWTyFA4JFRUdjp8JmASC/QkpRaDo9+SdGWh/uiIIwHKRlz+kd0LgEcbfNZBsFZm0ZEUEgk6/DR9qEZOX9XiibDdZrrxlhphE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UvNKl9xu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UvNKl9xu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733794856; x=1765330856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9TLB1vZxyO8jZrtpMnVC+PQYenlBfz/zv+70ort9P0I=;
  b=UvNKl9xuRMmW0fJkt+UzGlh3hggfg09cTsjIAXGbmuGis+3hhq+Bm83a
   TMaZDR+n/1w6J8bgN5Px2Ja5t63NJZWEBErnf/3n9+CEO1wFU8g2YSIbV
   iRkb4MEMs7TQbX++RCn/iIQ1Wn1WZwnul0bLL21s8xCpq+jR0Xh2MtqAY
   aOGufakoIZRKjWYNlHvPBxzYJkOJavHhLLz/nHRyx+7+uy+FKWb4a5Tkw
   +w9F2Hf1mO9cJMlq/xFEhiACwdNBBsklUkZwBjhydyiVrKRln7NA5I6kp
   jcsDZ3UpMtQ+57dWW2BFaFIAKj3KMec8mX3rxwdxHyCakx9p595ylzhE7
   w==;
X-CSE-ConnectionGUID: 39bB6wQoQfKTov4Y4imVOw==
X-CSE-MsgGUID: gbmKSX6PRUOxgzO45ynNkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34262725"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="34262725"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 17:40:55 -0800
X-CSE-ConnectionGUID: gz/o9wUrS9yRG9fg0xHpeA==
X-CSE-MsgGUID: F/Z6X945S/usUZA7iKHKUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="126147886"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2024 17:40:54 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKpF6-00051B-0T;
	Tue, 10 Dec 2024 01:40:52 +0000
Date: Tue, 10 Dec 2024 09:40:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shuai Wu <wushuai51@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1613/1613] WARNING: modpost: vmlinux: section
 mismatch in reference: virtio_fs_init+0x79 (section: .init.text) ->
 virtio_fs_sysfs_exit (section: .exit.text)
Message-ID: <202412100915.WfanJ73e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   db988390007bce595dba0dfd782c610578e26d2d
commit: cc6009cb24f9754275aa850a61fd12554acdec36 [1613/1613] virtiofs: export filesystem tags through sysfs
config: x86_64-buildonly-randconfig-005-20241210 (https://download.01.org/0day-ci/archive/20241210/202412100915.WfanJ73e-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100915.WfanJ73e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100915.WfanJ73e-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: virtio_fs_init+0x79 (section: .init.text) -> virtio_fs_sysfs_exit (section: .exit.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
