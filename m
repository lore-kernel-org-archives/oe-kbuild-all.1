Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE46A55
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 03:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721877471; cv=none; b=l4w9313Dkw8pWzkDFYqzgphxiKrjexCjBTXj4zNsSUJG8umerFvLZLtK9zYGg0jJtyak8wBjT12farqDxJxMKAM1hOIzvfF5FFXDA60vHks1LCCuIW/XVMoOG7JRAeBCzT3yfYbZ4lqrx6kCdQjrij85Nk8FoUJIhzDQyemLutc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721877471; c=relaxed/simple;
	bh=LpnWJw3hGp2/H0wh94X9CvJZOi4aN+3AlPpmyxHso7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y3D6Ck26zx7/pHV8Ll90UsyWLD4QPcbB0GBvai5bytBoUF3dUy0anw5bKuAEcrFjyiAX32KXAPU0g2T8CIv8BdWrqDtfiNo3pWOuOUtok6SyCDcPbmXp6VD50OXKSQP9om1Riw8mTN5vTukKoLVBOW2qkL7eGwnR2leDwM6BxNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oH+nRBoJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oH+nRBoJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721877469; x=1753413469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LpnWJw3hGp2/H0wh94X9CvJZOi4aN+3AlPpmyxHso7o=;
  b=oH+nRBoJqLePfXlLKuabjL1XEyNvv7p8ijme2KX+SlcrtO4j8zCkjxzn
   ALE686QmD8LEHh5sbzNUBSm8WLK77+daAk7PK6WrmVlM6egO2zZihLOEo
   pCNKy1aaEiFanx5ys8ZJ+Fw2M7SwglkOy3OSdrIJGIXM+AR5qZkf98IA+
   4+sMbPmvzRug6VoMXch4Nauf7fnGLFQDEv5VcWTN8EyMgXwpO073KrVWi
   ky0Osfo9Jofbh1tFy2y3yd63IzySqOLasviKfGrPyt/pKTlKBiLC2nNGm
   AqLWbwduZ18k+YIC/jEpUGo9ATK62ueoWy7fEbrtc49wExbnC0P+PIW1h
   g==;
X-CSE-ConnectionGUID: knzzgVNyQl+U1S4RJIe0Kw==
X-CSE-MsgGUID: vPTgUNMySleUvOhESmIE+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="31009988"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; 
   d="scan'208";a="31009988"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 20:17:48 -0700
X-CSE-ConnectionGUID: VBp5a9joR8acBVyUwUzd2w==
X-CSE-MsgGUID: zW675bdSQtaiDXKYUbT8kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; 
   d="scan'208";a="52813919"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Jul 2024 20:17:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWozB-000nhs-0X;
	Thu, 25 Jul 2024 03:17:45 +0000
Date: Thu, 25 Jul 2024 11:17:41 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsd-testing 9/9] fs/nfsd/nfs4proc.c:1622:40: warning:
 'nfsd4_cb_offload_ops' defined but not used
Message-ID: <202407251114.wyD7fzXB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   4e7058acdd17cdaaeedf1ace203e539dd08a2689
commit: 4e7058acdd17cdaaeedf1ace203e539dd08a2689 [9/9] NFSD: Drop CB_OFFLOAD Calls
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240725/202407251114.wyD7fzXB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240725/202407251114.wyD7fzXB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407251114.wyD7fzXB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/nfs4proc.c:1622:40: warning: 'nfsd4_cb_offload_ops' defined but not used [-Wunused-const-variable=]
    1622 | static const struct nfsd4_callback_ops nfsd4_cb_offload_ops = {
         |                                        ^~~~~~~~~~~~~~~~~~~~


vim +/nfsd4_cb_offload_ops +1622 fs/nfsd/nfs4proc.c

e0639dc5805a9d4 Olga Kornievskaia 2018-07-20  1621  
e0639dc5805a9d4 Olga Kornievskaia 2018-07-20 @1622  static const struct nfsd4_callback_ops nfsd4_cb_offload_ops = {
e0639dc5805a9d4 Olga Kornievskaia 2018-07-20  1623  	.release = nfsd4_cb_offload_release,
e0639dc5805a9d4 Olga Kornievskaia 2018-07-20  1624  	.done = nfsd4_cb_offload_done
e0639dc5805a9d4 Olga Kornievskaia 2018-07-20  1625  };
e0639dc5805a9d4 Olga Kornievskaia 2018-07-20  1626  

:::::: The code at line 1622 was first introduced by commit
:::::: e0639dc5805a9d4faaa2c07ad98fa853b9529dd3 NFSD introduce async copy feature

:::::: TO: Olga Kornievskaia <kolga@netapp.com>
:::::: CC: J. Bruce Fields <bfields@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
