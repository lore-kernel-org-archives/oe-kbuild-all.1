Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313F83E46D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 19:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709406600; cv=none; b=aLXmoDFTE9ayy0iDSCDKfZ2YkwtKe12N8qsD/zwLSrgQ2+5iXm72vGsYkmlqO949CvcIwBOHo/vv3oWnKVJcCfaOl32mJOxFP630Uk0v9sKTe4HQgGKyVzhDIykNX1hQhAWb8mKAGjrZG5ZvYY6G2ELAL56HtX5AeJd+HlLit8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709406600; c=relaxed/simple;
	bh=fMtOSkZhN/R47JLT2m64xrPfRSiHqKjiiaRO6ZGVSgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gHTQMRdYYhibGg1+9FNvmFDvwb72yhXIoePbdsTLvZZHCCeGwlpTS4ea86u+heE64nYq5pj1PbNujlJgHy7QlcRwmdDPOpFcPz4Pq5Ue5usZ6uETFH0lz1cMkDm27/HONekKvejJrL9M9RDOc0LRDhSFhrmPCvYXsWOuWrSKT9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFXqqjRL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFXqqjRL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709406598; x=1740942598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fMtOSkZhN/R47JLT2m64xrPfRSiHqKjiiaRO6ZGVSgM=;
  b=nFXqqjRLombx6jZov5NP7i90JPJDBxP38b6XlMVwKiyEefJMJjXSHrHc
   ljoQXza94GTx19KcyfJ8H5r7QPMbVrAuH3rXReI7U7duWuzxhUDCJXrvi
   UtXMhPdB+712Z8KbJmUVbJ6tO+gzumP2CLJZIlysfBXJGFI+cfv9tFtF4
   nTAtmr33FAbDaP/OCcgIqiAXon/44UPge43i0lwSgUNOGfoHTTjA0VxtW
   ZBS3tKN37Uzcgdss5GShUS+XDqE2oNvGekJp02zh+3L/40u8ckABpXe8s
   AAJME8PSU6iBAR4WVxMo5atMdxFHnghb4ze0FB/1VKL5S3FpfdmAQ/88v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="4104944"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="4104944"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 11:09:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="8483639"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Mar 2024 11:09:56 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgUk6-0000ES-24;
	Sat, 02 Mar 2024 19:09:54 +0000
Date: Sun, 3 Mar 2024 03:09:10 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-latest 39/42] zc_rx.c:(.text+0x1b44): dangerous
 relocation: unsupported relocation
Message-ID: <202403030235.FpSzvsNW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-latest
head:   c1d6911c6966e5ee49ee8fb26fa57101979dab2e
commit: 8d815a70f4122606af44db04b82ed8612b8a5d53 [39/42] io_uring: add io_recvzc request
config: arm64-randconfig-002-20240302 (https://download.01.org/0day-ci/archive/20240303/202403030235.FpSzvsNW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403030235.FpSzvsNW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403030235.FpSzvsNW-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: io_uring/zc_rx.o: in function `io_zc_rx_recv':
   zc_rx.c:(.text+0x1b44): undefined reference to `tcp_recvmsg'
   aarch64-linux-ld: io_uring/zc_rx.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `tcp_recvmsg' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> zc_rx.c:(.text+0x1b44): dangerous relocation: unsupported relocation
   aarch64-linux-ld: zc_rx.c:(.text+0x1b4c): undefined reference to `tcp_recvmsg'
   aarch64-linux-ld: zc_rx.c:(.text+0x1bc0): undefined reference to `tcp_read_sock'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
