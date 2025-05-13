Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D188218D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 00:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747094503; cv=none; b=TaLWpfHr1TBAmVnXj2bK+6OgC6obIz2spDM56sG2L09MM8BZ/QZhUMFoLHIGC4/ybZCzvq5LTFLThSMLSu0YRkUImnhma+sacU0M52TmjOnCQsBVGWVKXDiIuYU8YgJ1tPHCxEXvUOqaLEA3uQLHxAjoOOnaZG2P6AXvlP/BWow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747094503; c=relaxed/simple;
	bh=MtorV4M5p+Ke1tL34ms6wWJ3TEs4iZoeXnaPrsRtaqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hv7BnIhi0MKdH7VVmIOj+wkq7tFK7vNgYhZEMA5KBWmeLDE3htpEukb5Knx9+rRNeRykfuX/H3tlg8M5eVqmdACpSe7jc6Z7EA85RuU/HCiaRO3xucwMUMIdKKWerQKGBBJ2oE3tbx10snFQcZrUZQu5lRLWD1OYEA3941hvKVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SbA+PTLb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbA+PTLb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747094502; x=1778630502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MtorV4M5p+Ke1tL34ms6wWJ3TEs4iZoeXnaPrsRtaqI=;
  b=SbA+PTLb4c4htxx4OXSoltd6zPkKScpaufozLbUq2Kd7HVplLHSHVfDe
   ptLgoAHuNIaaNRngpRE6sTAEq8EZlAoqJKl7h6X80LCQYItVtTPEEbL6Q
   W1IkqGEAnbUiLn3jYkLvJTMTJkgaSPqJxKKn9ZTNNA1ejkMuGCcuKy8/S
   x2wMDN1IWdC4SztYtCieBJBFroHaFt+p3Lzs9HnF/EX8b7FeG5LqcbOeq
   8doRGdsgcQ2hc/F7T7NSOG4gbAbDAcDY2T/eP1HKRFFmHdHOPzX9Qdz7c
   moaXybJFiVBGhF6SlPZAHqlQh9xEI512FmuIopH/i7Is0dbahjZxK01Fx
   Q==;
X-CSE-ConnectionGUID: LjlpOjFRTC6sLITPM1mFMg==
X-CSE-MsgGUID: SEELJQKrTquOzjGwAVWw8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66464602"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="66464602"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 17:01:40 -0700
X-CSE-ConnectionGUID: LnN/lWByRsKuHQsH6vIQHQ==
X-CSE-MsgGUID: qH7AyExYRaun7Hj1MeCu5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="137931952"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 May 2025 17:01:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEd5V-000FXX-0D;
	Tue, 13 May 2025 00:01:37 +0000
Date: Tue, 13 May 2025 08:01:35 +0800
From: kernel test robot <lkp@intel.com>
To: Athira Rajeev <atrajeev@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [linuxppc:next-test 35/44]
 arch/powerpc/platforms/pseries/htmdump.c:246:25: sparse: sparse: cast to
 restricted __be64
Message-ID: <202505130747.zSqkKcnX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/linuxppc/linux next-test
head:   2c54e431574f829ec0895d5104575b3f209eae28
commit: 627cf584f4c36acb52230ffc47403cf9469ec9d0 [35/44] powerpc/pseries/htmdump: Add htm status support to htmdump module
config: powerpc64-randconfig-r132-20250513 (https://download.01.org/0day-ci/archive/20250513/202505130747.zSqkKcnX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250513/202505130747.zSqkKcnX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505130747.zSqkKcnX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/htmdump.c:246:25: sparse: sparse: cast to restricted __be64

vim +246 arch/powerpc/platforms/pseries/htmdump.c

   208	
   209	static ssize_t htmstatus_read(struct file *filp, char __user *ubuf,
   210				     size_t count, loff_t *ppos)
   211	{
   212		void *htm_status_buf = filp->private_data;
   213		long rc, ret;
   214		u64 *num_entries;
   215		u64 to_copy;
   216		int htmstatus_flag;
   217	
   218		/*
   219		 * Invoke H_HTM call with:
   220		 * - operation as htm status (H_HTM_OP_STATUS)
   221		 * - last three values as addr, size and offset
   222		 */
   223		rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
   224					   htmtype, H_HTM_OP_STATUS, virt_to_phys(htm_status_buf),
   225					   PAGE_SIZE, 0);
   226	
   227		ret = htm_return_check(rc);
   228		if (ret <= 0) {
   229			pr_debug("H_HTM hcall failed for op: H_HTM_OP_STATUS, returning %ld\n", ret);
   230			return ret;
   231		}
   232	
   233		/*
   234		 * HTM status buffer, start of buffer + 0x10 gives the
   235		 * number of HTM entries in the buffer. Each nest htm status
   236		 * entry is 0x6 bytes where each core htm status entry is
   237		 * 0x8 bytes.
   238		 * So total count to copy is:
   239		 * 32 bytes (for first 7 fields) + (number of HTM entries * entry size)
   240		 */
   241		num_entries = htm_status_buf + 0x10;
   242		if (htmtype == 0x2)
   243			htmstatus_flag = 0x8;
   244		else
   245			htmstatus_flag = 0x6;
 > 246		to_copy = 32 + (be64_to_cpu(*num_entries) * htmstatus_flag);
   247		return simple_read_from_buffer(ubuf, count, ppos, htm_status_buf, to_copy);
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
