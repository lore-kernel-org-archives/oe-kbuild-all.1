Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FE91C460C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 19:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730315496; cv=none; b=LmhGTNEuYktpYE2xiZzgpnq01f9dPbvaaKWWwl8JdCCEzGXjvrF/2NijvMtQa7rleeDjyKyNWmlPej/t9992BeY5AymIzWfu2pyEtwVrz4TEv7A0skGxTGQYOJsrUOsVP63EGQiCUJfP0jS/vFIkBZ2otEn5OvNaxx/JuyD8dGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730315496; c=relaxed/simple;
	bh=uY16/0VoPuURsxYzoQrZ9/3vf6eGy6VBjTF9lB8TrFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X5Zpf2+R0x8tfLSrurnIrMBLEHE6MNieGtUQUYr8vwpf18ydltQaQuKmjeiPD1eE26WvKN5RXm81OjB7JerQl5f1lmr3DFAYFMAku77gnjh45Z9w4O63qMM9DeS312xehy4yeeL+R9DeGFeAXXyOLmcXjWLIdeLqtU4jmILxIis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivPOrlkF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivPOrlkF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730315494; x=1761851494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uY16/0VoPuURsxYzoQrZ9/3vf6eGy6VBjTF9lB8TrFc=;
  b=ivPOrlkFPLJYY5M36jC1R5UIdFKKPu3PsU/pZAg381kFC9n4npbiXFX6
   ir9N4nUiqS8z6hRGXigX6GdEY9KWGrFw8Vj3chAKJx/qMZGDKYPmTemw9
   zk56vCxPam/0a50Log7TQZiTkOr7fTl7Wg/EdrIBB5eCVe9iqzBQJfMsi
   xF1vb3mso/Oy6oXwuB8V+Fj1sPpZZNZzoa/f3dtVNVTFqhKLmZpR7N8wg
   oIuE6nwku1LtdksduaiYOeUl0/8aBMJ8fFsQcX0g51/AKZFM4DQVTXPRN
   U2Y/uKyv/5SreirY0mYkCUYWQkgXp3uUaJGYQRLlSAZakktwy0LynLDJN
   w==;
X-CSE-ConnectionGUID: 0lnCkF1iQF2XzheFQjdlzA==
X-CSE-MsgGUID: +TfaUv9JSwu/tdqkkViW7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="17679974"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="17679974"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 12:11:34 -0700
X-CSE-ConnectionGUID: R0c32UmdRbmATwUrbuuUhg==
X-CSE-MsgGUID: OQyT51qIS/y06D+LVCeQPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="82501764"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Oct 2024 12:11:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6E6K-000fEC-1C;
	Wed, 30 Oct 2024 19:11:28 +0000
Date: Thu, 31 Oct 2024 03:11:02 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 25/98] net/core/net-procfs.c:344:45: sparse:
 sparse: cast removes address space '__percpu' of expression
Message-ID: <202410310318.WeKIPsO0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: d9324ddd538a0b57dbee8623806ff9b9f7811202 [25/98] net: dev ipv4/v6 stat
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241031/202410310318.WeKIPsO0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310318.WeKIPsO0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310318.WeKIPsO0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/net-procfs.c:344:45: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/net-procfs.c:344:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *mib @@     got void [noderef] __percpu ** @@
   net/core/net-procfs.c:344:45: sparse:     expected void [noderef] __percpu *mib
   net/core/net-procfs.c:344:45: sparse:     got void [noderef] __percpu **

vim +/__percpu +344 net/core/net-procfs.c

   334	
   335	static void dev_ext_seq_printf_stats(struct seq_file *seq, void *v)
   336	{
   337		struct net_device *dev = (struct net_device *)v;
   338		int i;
   339	
   340		seq_printf(seq, "%10s  ", dev->name);
   341	
   342		for (i = 0; snmp_devstat_list[i].name; i++)
   343			seq_printf(seq, " %12lu",
 > 344				   snmp_fold_field((void __percpu **)
   345						   dev->mib.dev_statistics,
   346						   snmp_devstat_list[i].entry));
   347		seq_putc(seq, '\n');
   348	}
   349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
