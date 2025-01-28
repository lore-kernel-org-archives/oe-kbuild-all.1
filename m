Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5921DED7C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 22:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738101709; cv=none; b=dAwYTabXwE5q2saTxUTeDb3CQrBt4wg83RgqYl0YB0GIChFcpPDxLKUY60znJ3zD0femHwj35wiqBLLJPQH7U0s7XHrqfQ6cdHZue7X+CXjTNBEKsJrtrfiSsPPKrjb62GELmTLYY7ERc97oQ9hEXSOl//HVqUmpplQtIeaaJpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738101709; c=relaxed/simple;
	bh=/Eyt7eH8WfZTpBEPnaqZUMj1OIFvqEInMn/SaE5t4go=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V0yCRV6FcclgMsYQ0VlkfcH06GZPJk+0+yJvjcL9QEYpaGIwjLnk1Ob3ibzraiIvPJnY4N6/4buqsCbPqNcBSq8i7sjn3fNbPWybtGo9Woof5z6AdESSRU0lPB9LWvN4DaJiZ71t5im2xxODSej/89kcJltBwo3VRn3uL/2qMF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0ZZzMFt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0ZZzMFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738101708; x=1769637708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Eyt7eH8WfZTpBEPnaqZUMj1OIFvqEInMn/SaE5t4go=;
  b=B0ZZzMFtmIyqzAFXvLNTSi/E4H1KCxGvcQwrfa5X1EdGY2P+1MEkuP/b
   6ds3Fx8Ulo/jXeTyAs4fbgMh5aXjgpik2rLZotEpmd7yoR1tUfsrolRWR
   i1vgOK6gJwwCvVs2M2oZsSon3G4bJZWTMv9L969uqJ/xcfiF3gr61rA+L
   thtYaYy5KQf2E33d/KxpzpB44md2WdMbJPtMQRfJiVlh99SoWJAE1s/bc
   AB95H7O/pOFW6YikK0ChybbPEehaRpEE1h1/k3znn2T6udVg94xcz0XhO
   DC3y6BLPGl7XMuyWWq3yfCLZY2rF3gWKomN0o70BETuOmvmSJXGFemi6a
   Q==;
X-CSE-ConnectionGUID: FSCZH8vQQEuf6wrH9K0JIQ==
X-CSE-MsgGUID: 6nkBL+zNTPq4IuhtGCdIrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38488453"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="38488453"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 14:01:38 -0800
X-CSE-ConnectionGUID: 0PCAhL4mSx+aIWTUKhtlfA==
X-CSE-MsgGUID: hP6YcLrwSRaIrsQpgUN3xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="108664124"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jan 2025 14:01:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcteI-000iHX-1w;
	Tue, 28 Jan 2025 22:01:34 +0000
Date: Wed, 29 Jan 2025 06:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 10065/10398] security/tomoyo/common.c:2010:
 warning: Function parameter or struct member 'colon' not described in
 'tomoyo_patternize_proc_path'
Message-ID: <202501290505.bKuh2g52-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9a87ce288fe30f268b3a598422fe76af9bb2c2d2
commit: 7788cabfc9cf4c8210a131fdd87e0f94f65ab70c [10065/10398] tomoyo: use better patterns for procfs in learning mode
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250129/202501290505.bKuh2g52-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501290505.bKuh2g52-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501290505.bKuh2g52-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/tomoyo/common.c:2010: warning: Function parameter or struct member 'colon' not described in 'tomoyo_patternize_proc_path'
>> security/tomoyo/common.c:2010: warning: Excess function parameter 'column' description in 'tomoyo_patternize_proc_path'


vim +2010 security/tomoyo/common.c

  1998	
  1999	/**
  2000	 * tomoyo_patternize_proc_path - Make patterns for procfs path. Used by learning mode.
  2001	 *
  2002	 * @buffer: Original line.
  2003	 * @column: Location of ':' in @buffer.
  2004	 * @len:    Size of @buffer.
  2005	 *
  2006	 * Returns new line.
  2007	 */
  2008	static char *tomoyo_patternize_proc_path(char * const buffer, const char * const colon,
  2009						 const int len)
> 2010	{
  2011		char *new_buffer;
  2012		const char *src = colon;
  2013		char *dest;
  2014		int const_len;
  2015		int variable_len;
  2016	
  2017		/* Nothing to do if process id part does not follow "proc:/". */
  2018		const_len = colon + 2 - buffer;
  2019		variable_len = tomoyo_digits_len(buffer + const_len);
  2020		if (!variable_len)
  2021			return buffer;
  2022		/* Allocate larger buffer for using "\$" pattern. */
  2023		new_buffer = kmalloc(len + 16, GFP_NOFS | __GFP_ZERO);
  2024		if (!new_buffer)
  2025			return buffer;
  2026		memmove(new_buffer, buffer, const_len);
  2027		src = buffer + const_len;
  2028		dest = new_buffer + const_len;
  2029		/*
  2030		 * Don't patternize process id part if pid == 1, for several
  2031		 * programs access only files in /proc/1/ directory.
  2032		 */
  2033		if (variable_len == 1 && *src == '1') {
  2034			*dest++ = *src++;
  2035		} else {
  2036			src += variable_len;
  2037			*dest++ = '\\';
  2038			*dest++ = '$';
  2039		}
  2040		/* Patternize thread id part if "/task/" follows. */
  2041		if (!strncmp(src, "/task/", 6)) {
  2042			memmove(dest, src, 6);
  2043			src += 6;
  2044			dest += 6;
  2045			variable_len = tomoyo_digits_len(src);
  2046			if (variable_len >= 1) {
  2047				src += variable_len;
  2048				*dest++ = '\\';
  2049				*dest++ = '$';
  2050			}
  2051		}
  2052		/* Patternize file descriptor part if "/fdinfo/" or "/fd/" follows. */
  2053		if (!strncmp(src, "/fdinfo/", 8)) {
  2054			memmove(dest, src, 8);
  2055			src += 8;
  2056			dest += 8;
  2057			variable_len = tomoyo_digits_len(src);
  2058			if (variable_len >= 1) {
  2059				src += variable_len;
  2060				*dest++ = '\\';
  2061				*dest++ = '$';
  2062			}
  2063		} else if (!strncmp(src, "/fd/", 4)) {
  2064			memmove(dest, src, 4);
  2065			src += 4;
  2066			dest += 4;
  2067			variable_len = tomoyo_digits_len(src);
  2068			if (variable_len >= 1) {
  2069				src += variable_len;
  2070				*dest++ = '\\';
  2071				*dest++ = '$';
  2072			}
  2073		}
  2074		/* Copy remaining part if any (e.g, $CMD part of "file ioctl" request). */
  2075		if (*src)
  2076			memmove(dest, src, strlen(src) + 1);
  2077		kfree(buffer);
  2078		return new_buffer;
  2079	}
  2080	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
