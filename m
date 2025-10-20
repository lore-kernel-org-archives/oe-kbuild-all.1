Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1BECA6F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 05:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760939280; cv=none; b=o/6oM7mrCiP7xXiWc6zK/SkMRa0/5Fz+UIpAw9FkWXQcQ/YJ6oPSM/bfhhioV0vrPrwsKgBqf1Jmr8htpBMmlicUl29hzf+ADMa/bd1S0VVdre7DX7/yNmCtEssb0RcvcFSqy28dq1fXm8fqGmvrm4lj4JBIeuTIXaiZIYVHqOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760939280; c=relaxed/simple;
	bh=2h4pE7OySkIhKd+LDGduf7UBTlrKkVR8ecUTbTTIQ68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKuTypdl9M/uGw+1URy2amZrJY62zUJQ8tLRAQwAxrQSgx9qzqCiCyKPCy/jjgtqGwhrppIuFCC7GU9vifWY2Z4RrjudiA8hiyK01BhFGM2vRhkAwpuWFphLKfwDsHK/gfV4bogbV3WrUgRCIryW9WWEe4IfUQjSrarSiDbct1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hlx+gAjp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hlx+gAjp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760939278; x=1792475278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2h4pE7OySkIhKd+LDGduf7UBTlrKkVR8ecUTbTTIQ68=;
  b=Hlx+gAjpNXuM0RycbdpKL/xAfdYolFzgdaKX3uV5QEw3tYOu6tTnYJS2
   YbJ09aZ6cG0+w3sOphz7g+OnPYNF8QYiIfM3Pm4UMgzxMTOsba3r30fTt
   W/roajX8VF4IT2htgw1+/hAc1oRsLiw3dfZSTeC6JtrJgErUN08dlqxAb
   POjcfF/1aAIIXYgJwl7B2DoMZEOFGi71YSqpH+GgkZOtp61RXa7JcYhbc
   mva/C28pO564oW4afO4ig7Yi3++dEQD+5u8ZMcgK+4e4y4N7Lyr+zzia9
   jVlNTVVyuPQOmVEkB/ThHUz32+j+HlV9aJmG2MoEDWgjypCANEyyLUlwV
   g==;
X-CSE-ConnectionGUID: VIemgK6GS+2/MsdGgHNyPA==
X-CSE-MsgGUID: zVZH1F3VR9WPaMoOjbqjGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="88520786"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="88520786"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 22:47:57 -0700
X-CSE-ConnectionGUID: SQ8XNrL/QLSHRV2cV8lKdA==
X-CSE-MsgGUID: zwKEcOZxS6aeDtUqYYvA4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="214215612"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 19 Oct 2025 22:47:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAijy-0009WH-18;
	Mon, 20 Oct 2025 05:47:41 +0000
Date: Mon, 20 Oct 2025 13:46:28 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 17/17] crypto: sha3 - Reimplement using library API
Message-ID: <202510201337.PoPUUVYu-lkp@intel.com>
References: <20251020005038.661542-18-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020005038.661542-18-ebiggers@kernel.org>

Hi Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on 123fa1574bccee87da735d13e89c931e88288b40]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Biggers/s390-sha3-Rename-conflicting-functions/20251020-085933
base:   123fa1574bccee87da735d13e89c931e88288b40
patch link:    https://lore.kernel.org/r/20251020005038.661542-18-ebiggers%40kernel.org
patch subject: [PATCH 17/17] crypto: sha3 - Reimplement using library API
config: nios2-randconfig-001-20251020 (https://download.01.org/0day-ci/archive/20251020/202510201337.PoPUUVYu-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510201337.PoPUUVYu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510201337.PoPUUVYu-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: crypto/sha3.o: in function `crypto_sha3_512_digest':
>> crypto/sha3.c:80: undefined reference to `sha3_512'
>> crypto/sha3.c:80:(.text+0x124): relocation truncated to fit: R_NIOS2_CALL26 against `sha3_512'
   nios2-linux-ld: crypto/sha3.o: in function `crypto_sha3_384_digest':
>> crypto/sha3.c:73: undefined reference to `sha3_384'
>> crypto/sha3.c:73:(.text+0x14c): relocation truncated to fit: R_NIOS2_CALL26 against `sha3_384'
   nios2-linux-ld: crypto/sha3.o: in function `crypto_sha3_256_digest':
>> crypto/sha3.c:66: undefined reference to `sha3_256'
>> crypto/sha3.c:66:(.text+0x174): relocation truncated to fit: R_NIOS2_CALL26 against `sha3_256'
   nios2-linux-ld: crypto/sha3.o: in function `crypto_sha3_224_digest':
>> crypto/sha3.c:59: undefined reference to `sha3_224'
>> crypto/sha3.c:59:(.text+0x1ec): relocation truncated to fit: R_NIOS2_CALL26 against `sha3_224'
   nios2-linux-ld: crypto/sha3.o: in function `sha3_final':
>> include/crypto/sha3.h:188: undefined reference to `__sha3_squeeze'
>> include/crypto/sha3.h:188:(.text+0x218): relocation truncated to fit: R_NIOS2_CALL26 against `__sha3_squeeze'
   nios2-linux-ld: crypto/sha3.o: in function `sha3_update':
>> include/crypto/sha3.h:172: undefined reference to `__sha3_update'
>> include/crypto/sha3.h:172:(.text+0x24c): relocation truncated to fit: R_NIOS2_CALL26 against `__sha3_update'


vim +80 crypto/sha3.c

    55	
    56	static int crypto_sha3_224_digest(struct shash_desc *desc,
    57					  const u8 *data, unsigned int len, u8 *out)
    58	{
  > 59		sha3_224(data, len, out);
    60		return 0;
    61	}
    62	
    63	static int crypto_sha3_256_digest(struct shash_desc *desc,
    64					  const u8 *data, unsigned int len, u8 *out)
    65	{
  > 66		sha3_256(data, len, out);
    67		return 0;
    68	}
    69	
    70	static int crypto_sha3_384_digest(struct shash_desc *desc,
    71					  const u8 *data, unsigned int len, u8 *out)
    72	{
  > 73		sha3_384(data, len, out);
    74		return 0;
    75	}
    76	
    77	static int crypto_sha3_512_digest(struct shash_desc *desc,
    78					  const u8 *data, unsigned int len, u8 *out)
    79	{
  > 80		sha3_512(data, len, out);
    81		return 0;
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
