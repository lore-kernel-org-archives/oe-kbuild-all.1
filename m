Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A31245BF0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 15:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716047807; cv=none; b=JasSAuTWvx00Q5okcdg0JSZev/Cq1Ejgij1QQQdUnufBwkk96mPmGCil0s3sbF6i4iHrdeI8lTgsA6dL2ru96k7ejeniz8QgsO4Jwyyh2sjxwIVmxchsSQHfBWjDrZlYf32IinWNsOgWNxyov9dFOdqa8vAeEV6rgnzZcxDYGOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716047807; c=relaxed/simple;
	bh=nmFNSSfLdRGhI4HbdHNFOUOvqZ/mx1dEkUPDlL0eFcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=frFG2f85b1iwehbAAz/u7/fTQx1Yyfi7CxvQA6KZodkLQL8OAj/GcrtKlnla9SHdL76GnW6SxC20+6vxXIx0TCAPSreXO4HE6SM87KRwgu2qf7oP6brlVj9EOiTNW9Y8UMmLmbKhzkjMIk4a14RJzfrCJ/It1eLabhwcJnXSvoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hb4mnv3l; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hb4mnv3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716047806; x=1747583806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nmFNSSfLdRGhI4HbdHNFOUOvqZ/mx1dEkUPDlL0eFcQ=;
  b=Hb4mnv3ljcRGKSbM5MQy/8/qO4uOpfAw25aSSGNUQXBISZvsftMzkreG
   D99x/N1CAWzrdVmDwlj6vLNYrHX7CkxGNOX+7pfVJdvBnrp9XhfMMKpyH
   GT0IscsIZqtOoej444zy5KkI1FyLN5vVQPJsWibTlAd9X/A/cPQBfYXch
   e5w0AFC8XcNE6BD/Kkkb5T3YdEFWyFnutFEilpdvNLPDCj5jmi3PoaFNz
   6YqnXIdu4DaSLgugTcqtxkWVrjsr4eb021JzUurXnbWUwcoCf9rG3Ek88
   S8ihSmHso+uc8Ni1I1dmUvjbyMrAn3j2q/76qeq3EWDXgWAoWfR0acRck
   g==;
X-CSE-ConnectionGUID: QcyIl7UNRYGbHCdDzsYIuA==
X-CSE-MsgGUID: Ix5SKW6sTyOrPENEffpG4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="16051329"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="16051329"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 08:56:45 -0700
X-CSE-ConnectionGUID: R2DT5I3NSwai5RgRZRpoLQ==
X-CSE-MsgGUID: Ba1f20r6QiKgz8mI/WQr2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="36602864"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 May 2024 08:56:43 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8MQJ-0002Lc-1Z;
	Sat, 18 May 2024 15:56:39 +0000
Date: Sat, 18 May 2024 23:56:08 +0800
From: kernel test robot <lkp@intel.com>
To: Srujana Challa <schalla@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Vamsi Attunuru <vattunuru@marvell.com>,
	Shijith Thotton <sthotton@marvell.com>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>
Subject: [linux-next:master 13118/13355] ERROR: modpost: "__aeabi_uldivmod"
 [drivers/vdpa/octeon_ep/octep_vdpa.ko] undefined!
Message-ID: <202405182336.ujsVvg0v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c75962170e49f24399141276ae119e6a879f36dc
commit: c9d853a0540291d48ab10fcf4e5a75f1f4741da9 [13118/13355] virtio: vdpa: vDPA driver for Marvell OCTEON DPU devices
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240518/202405182336.ujsVvg0v-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405182336.ujsVvg0v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405182336.ujsVvg0v-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/trace/preemptirq_delay_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bpf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_kmod.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_blackhole_dev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_ccmp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_tkip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_wep.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/configfs/configfs_sample.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestream-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kretprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kmemleak/kmemleak-test.o
>> ERROR: modpost: "__aeabi_uldivmod" [drivers/vdpa/octeon_ep/octep_vdpa.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
