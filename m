Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267973195E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 04:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765860180; cv=none; b=GOYgNGVw2Uf1RFbh6Jsmdu+FcSXC9Guu9kY0vVRThbPpjrq/1yuWt7E/jpDQ1dYRVcd0VAn9114R5S8xn0GLSVzuqGl/zaHwzfjHlEWEZP3Z4dnQIdRpfQJmYejDO46H4aNrS4XB+O7bDLiJpLM/cja9GbSittZ6WUGuQD5XQdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765860180; c=relaxed/simple;
	bh=r6QjMT1PDXYkm3QI7F6MOVPizXDtpNNViXiiJEX26DM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sVNIMFMUBA2SuTxEZBujmbpjRVXeiKFcRb9pnlU9c9I4pFmUoHDhnOssmvXMAy6rYsu77bqa2nGKiIlotyat4Hqa5ofD/UjZWwhITzp7gP2XjXDf0Ia9QrwJE+t4XISiV4keU2ZbwYV5O/Dtw3ZetMcpr4p/GxmEAJSUydCG54s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLhZfQMr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLhZfQMr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765860176; x=1797396176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r6QjMT1PDXYkm3QI7F6MOVPizXDtpNNViXiiJEX26DM=;
  b=SLhZfQMro3mctWroVz1IwjzMfe8ThfPWn8vsflIf8Nt91EYjgnclhHTG
   XKAgqql3Bybzthl1S3/XSOyHOJRw95u31k/LrCQQMS+mTrOdmNB04o+09
   WoJo8lodZxnE9CYjbqYJ/54Waidz+Arb3jekoxVRbsL87GM35wxwT4Viu
   bkGnSHJpf+6DEfsI3c7HLzIehdPfrQ2qftII+5epIoLDxI38DVHWvUxOf
   CPDsoHOBBUDVVU1TFzXpj8zRZYcIOG0/asBFL0s2L+QXIZIwrdNvZDKZ5
   YfG0h8hItoaO9T6qe8UDjtyY+zkCzHfajXbnF7nVG489s3MqenAGFxW5W
   w==;
X-CSE-ConnectionGUID: WLZdM6uCSDS/SlogZfJsnw==
X-CSE-MsgGUID: Hd0DgjqCTTaAUtkLovMQMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67844111"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="67844111"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 20:42:51 -0800
X-CSE-ConnectionGUID: 9GiGxYrYSXelx1nZtvQfnQ==
X-CSE-MsgGUID: JjybpzudTMytK2Zm86oNvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="228986797"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 15 Dec 2025 20:42:51 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVMtc-000000001AB-2itH;
	Tue, 16 Dec 2025 04:42:48 +0000
Date: Tue, 16 Dec 2025 12:42:41 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50]
 drivers/crypto/ccp/hygon/psp-dev.c:183: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202512161218.ltnzLJ7O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   8021645c122892ec7df09270bcd640dc4c766f82
commit: 233dbf30e3bc7b13f1f9a0bf054504691218e641 [50/50] anolis: crypto: ccp: Reduce more code intrusion in psp-dev.c and sev-dev.c
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251216/202512161218.ltnzLJ7O-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161218.ltnzLJ7O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161218.ltnzLJ7O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/psp-dev.c:183: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * When 'allow_default_vid' is set to 1,
   drivers/crypto/ccp/hygon/psp-dev.c:200: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * When the virtual machine executes the 'tkm' command,
   drivers/crypto/ccp/hygon/psp-dev.c:225: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Upon qemu startup, this section checks whether
   drivers/crypto/ccp/hygon/psp-dev.c:253: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Upon the virtual machine is shut down,


vim +183 drivers/crypto/ccp/hygon/psp-dev.c

   181	
   182	/**
 > 183	 * When 'allow_default_vid' is set to 1,
   184	 * QEMU is allowed to use 'vid 0' by default
   185	 * in the absence of a valid 'vid' setting.
   186	 */
   187	uint32_t allow_default_vid = 1;
   188	void vpsp_set_default_vid_permission(uint32_t is_allow)
   189	{
   190		allow_default_vid = is_allow;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
