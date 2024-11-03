Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0C2145FE5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 06:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730614099; cv=none; b=d/N0TsKESOZGxDfm0cBdVFzIO03rSvUhjLXzkNl4zBBXahvDiBWqjI8/pZG1HZh6AwcJqiyDMk6NVjaAz5ke1puNvYC71G1xj8L/EYcaFLF8XuZipy0VtPku0RDdqjoFOQCbKuorsQRJh6l0odc3ls3/riWgpBG/YfLlEA9M2t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730614099; c=relaxed/simple;
	bh=xAw60lrFb1VS8bOsfumV01BpR/OVkvq/v2Qkm83CDfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A3qIID3HX4f3sh9b6e1sPX7lo49b+5g0avWCtBYKCwhkaZa8gPNDC6gynqdJxL5R6nuOYeeKHASXwetTmH0hdcH9v2IUzG64WfjEPW45zbdEn6F3qObjIWqUTQ9vFsY1zPAVe5pY4iAEkxgFFAgm+DXfVYamZbuIHFI+MHEEYR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJJYzNm6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJJYzNm6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730614097; x=1762150097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xAw60lrFb1VS8bOsfumV01BpR/OVkvq/v2Qkm83CDfs=;
  b=EJJYzNm6Sn2eIzHWfO/G6ofAlKhvtJnU1NPTASR4nNQlPd8gn89tAcCF
   vdzjC3atKdr+f66Pyw/56pCib+BRY47uUoU263aQ4sPcwXMT9dOMectDy
   9wIYhqoBh6oq30PnSnFZwwTxeiWAqDjrQC2wALTX6v4SEKc40ZU8YIxz3
   VTWg7yO1QbjwOaOtl7u1F/50HjBrovJtx6W6hKdAmorWpldXG2XuPQlwB
   kHheANHoRTF7SruLszCdP/Ean/MGCJazJePYutATpKribcR4mCXeU28q/
   W2JepqeyCEV/AuXlpRaLgbWF4WjOak2SvUyIHXDJlzb+KLN2WDF4Z3No1
   g==;
X-CSE-ConnectionGUID: 1s0Whg7ySv6IZg/VA/ikrw==
X-CSE-MsgGUID: a+JiRL2cQaCm6e85zhyJHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="47828625"
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="47828625"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 23:08:16 -0700
X-CSE-ConnectionGUID: aReC59SlSF2PexdnWLWhmg==
X-CSE-MsgGUID: kzdc/fDDR5W6j++5lJvGgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="114129154"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Nov 2024 23:08:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7TmX-000jjz-0O;
	Sun, 03 Nov 2024 06:08:13 +0000
Date: Sun, 3 Nov 2024 14:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v8 10/12] crypto/tpm2_key.c:104: warning:
 expecting prototype for tpm_key_decode(). Prototype was for
 tpm2_key_decode() instead
Message-ID: <202411031414.PYyZRgA4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v8
head:   b637d35eb650ccca25c1ca557582940da3e82c9e
commit: 9010b7ed4317dd437363e3b9e9a887382f38d731 [10/12] crypto: tpm2_key: Introduce a TPM2 key type
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241103/202411031414.PYyZRgA4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031414.PYyZRgA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031414.PYyZRgA4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/tpm2_key.c:104: warning: expecting prototype for tpm_key_decode(). Prototype was for tpm2_key_decode() instead


vim +104 crypto/tpm2_key.c

    88	
    89	/**
    90	 * tpm_key_decode() - Decode TPM2 ASN.1 key
    91	 * @src:	ASN.1 source.
    92	 * @src_len:	ASN.1 source length.
    93	 *
    94	 * Decodes the TPM2 ASN.1 key and validates that the public key data has all
    95	 * the shared fields of TPMT_PUBLIC. This is full coverage of the memory that
    96	 * can be validated before doing any key type specific validation.
    97	 *
    98	 * Return:
    99	 * - TPM2 ASN.1 key on success.
   100	 * - -EBADMSG when decoding fails.
   101	 * - -ENOMEM when OOM while allocating struct tpm2_key.
   102	 */
   103	struct tpm2_key *tpm2_key_decode(const u8 *src, u32 src_len)
 > 104	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
