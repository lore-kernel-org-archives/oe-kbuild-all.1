Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE7369D02
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 08:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710231694; cv=none; b=t18zYLMyOLtXGeJCZovtqrTRfDqlMwLqjtEmIqiZffd2inrLmTWAGZ8O0i9HFCv2M2Z8/+qzoRbjBv3ZatU9gbnN9eFElKm09Tgjcw89d3Y69lN3oJPBOcwIXhN3VisAmkLy8u/wtvuLVfbJmDvJb2q7wWwGlPUpTSE2UxPRsTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710231694; c=relaxed/simple;
	bh=U/tefQul3cyLVhq544Gnba+Ixoy+iJpoMT+vQYCbZY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkXpg9xMaxORTViqU8dy9rn1BzIaCZeG8LkUD+V499EFQQoQ37sdVYZL/Lnjh0g1QyV3h9gJoDWVXWp36U3Sf1hhJF/sL5LfCm3YtAaEIh6fe3diS7NtvS/c42z8kj6knvmsxqiYx/+HIRMU3CIPd5Xyn/Vj9Wi013GLRlzrTak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FVIY/Ld5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FVIY/Ld5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710231692; x=1741767692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U/tefQul3cyLVhq544Gnba+Ixoy+iJpoMT+vQYCbZY4=;
  b=FVIY/Ld5A3JR7VwErwKmdCThJsG2XVS3bWJ7BJaah/eAcXaX19jeUIFP
   h5fN5L4ZSvhNyGTWpmiCYTtGDd+2NPDE66WlokBBqjtJ28hjdn4gRM21o
   csAS53GGrAcpSxwFtDz+pSjt/PZHUz/gC5VI6+k6y7SLPaIihGH/7ZrBf
   bkAeXJZmTDrNfx99BRG8krSx2RXjn0qfiBJPCxLTFjjrGqMWU4aGVOHlS
   Loc9WewdvlQQFLQBp5Ek9sekvT094mU2Yibi5edOPAH1+9Ojl2DmkNfsV
   c7JyNizRKqPihi50I2td8d0UqdonSTMt+feMDoZl6AjyVd4lgPX3LZMhz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4855136"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="4855136"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 01:21:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="48900993"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Mar 2024 01:21:25 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjxNy-0009yF-2X;
	Tue, 12 Mar 2024 08:21:22 +0000
Date: Tue, 12 Mar 2024 16:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: Xin Long <lucien.xin@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 4/5] net: integrate QUIC build configuration
 into Kconfig and Makefile
Message-ID: <202403121645.PBuaPXeH-lkp@intel.com>
References: <f5678996612dc82c990da0dbceb19dcd062d97bd.1710173427.git.lucien.xin@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5678996612dc82c990da0dbceb19dcd062d97bd.1710173427.git.lucien.xin@gmail.com>

Hi Xin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Long/net-define-IPPROTO_QUIC-and-SOL_QUIC-constants-for-QUIC-protocol/20240312-002959
base:   net-next/main
patch link:    https://lore.kernel.org/r/f5678996612dc82c990da0dbceb19dcd062d97bd.1710173427.git.lucien.xin%40gmail.com
patch subject: [RFC PATCH net-next 4/5] net: integrate QUIC build configuration into Kconfig and Makefile
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240312/202403121645.PBuaPXeH-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403121645.PBuaPXeH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403121645.PBuaPXeH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/quic/crypto.c: In function 'quic_crypto_set_secret':
>> net/quic/crypto.c:560:29: warning: variable 'keylen' set but not used [-Wunused-but-set-variable]
     560 |         int err, secretlen, keylen;
         |                             ^~~~~~


vim +/keylen +560 net/quic/crypto.c

b53fc4edb7faf3 Xin Long 2024-03-11  556  
b53fc4edb7faf3 Xin Long 2024-03-11  557  int quic_crypto_set_secret(struct quic_crypto *crypto, struct quic_crypto_secret *srt,
b53fc4edb7faf3 Xin Long 2024-03-11  558  			   u32 version, u8 flag)
b53fc4edb7faf3 Xin Long 2024-03-11  559  {
b53fc4edb7faf3 Xin Long 2024-03-11 @560  	int err, secretlen, keylen;
b53fc4edb7faf3 Xin Long 2024-03-11  561  	struct quic_cipher *cipher;
b53fc4edb7faf3 Xin Long 2024-03-11  562  	void *tfm;
b53fc4edb7faf3 Xin Long 2024-03-11  563  
b53fc4edb7faf3 Xin Long 2024-03-11  564  	if (!crypto->cipher) {
b53fc4edb7faf3 Xin Long 2024-03-11  565  		crypto->version = version;
b53fc4edb7faf3 Xin Long 2024-03-11  566  		if (srt->type < QUIC_CIPHER_MIN || srt->type > QUIC_CIPHER_MAX)
b53fc4edb7faf3 Xin Long 2024-03-11  567  			return -EINVAL;
b53fc4edb7faf3 Xin Long 2024-03-11  568  
b53fc4edb7faf3 Xin Long 2024-03-11  569  		cipher = &ciphers[srt->type - QUIC_CIPHER_MIN];
b53fc4edb7faf3 Xin Long 2024-03-11  570  		tfm = crypto_alloc_shash(cipher->shash, 0, 0);
b53fc4edb7faf3 Xin Long 2024-03-11  571  		if (IS_ERR(tfm))
b53fc4edb7faf3 Xin Long 2024-03-11  572  			return PTR_ERR(tfm);
b53fc4edb7faf3 Xin Long 2024-03-11  573  		crypto->secret_tfm = tfm;
b53fc4edb7faf3 Xin Long 2024-03-11  574  
b53fc4edb7faf3 Xin Long 2024-03-11  575  		tfm = crypto_alloc_aead(cipher->aead, 0, CRYPTO_ALG_ASYNC);
b53fc4edb7faf3 Xin Long 2024-03-11  576  		if (IS_ERR(tfm)) {
b53fc4edb7faf3 Xin Long 2024-03-11  577  			err = PTR_ERR(tfm);
b53fc4edb7faf3 Xin Long 2024-03-11  578  			goto err;
b53fc4edb7faf3 Xin Long 2024-03-11  579  		}
b53fc4edb7faf3 Xin Long 2024-03-11  580  		crypto->tag_tfm = tfm;
b53fc4edb7faf3 Xin Long 2024-03-11  581  		crypto->cipher = cipher;
b53fc4edb7faf3 Xin Long 2024-03-11  582  		crypto->cipher_type = srt->type;
b53fc4edb7faf3 Xin Long 2024-03-11  583  	}
b53fc4edb7faf3 Xin Long 2024-03-11  584  
b53fc4edb7faf3 Xin Long 2024-03-11  585  	cipher = crypto->cipher;
b53fc4edb7faf3 Xin Long 2024-03-11  586  	secretlen = cipher->secretlen;
b53fc4edb7faf3 Xin Long 2024-03-11  587  	keylen = cipher->keylen;
b53fc4edb7faf3 Xin Long 2024-03-11  588  	if (!srt->send) {
b53fc4edb7faf3 Xin Long 2024-03-11  589  		memcpy(crypto->rx_secret, srt->secret, secretlen);
b53fc4edb7faf3 Xin Long 2024-03-11  590  		tfm = crypto_alloc_aead(cipher->aead, 0, flag);
b53fc4edb7faf3 Xin Long 2024-03-11  591  		if (IS_ERR(tfm)) {
b53fc4edb7faf3 Xin Long 2024-03-11  592  			err = PTR_ERR(tfm);
b53fc4edb7faf3 Xin Long 2024-03-11  593  			goto err;
b53fc4edb7faf3 Xin Long 2024-03-11  594  		}
b53fc4edb7faf3 Xin Long 2024-03-11  595  		crypto->rx_tfm[0] = tfm;
b53fc4edb7faf3 Xin Long 2024-03-11  596  		tfm = crypto_alloc_aead(cipher->aead, 0, flag);
b53fc4edb7faf3 Xin Long 2024-03-11  597  		if (IS_ERR(tfm)) {
b53fc4edb7faf3 Xin Long 2024-03-11  598  			err = PTR_ERR(tfm);
b53fc4edb7faf3 Xin Long 2024-03-11  599  			goto err;
b53fc4edb7faf3 Xin Long 2024-03-11  600  		}
b53fc4edb7faf3 Xin Long 2024-03-11  601  		crypto->rx_tfm[1] = tfm;
b53fc4edb7faf3 Xin Long 2024-03-11  602  		tfm = crypto_alloc_sync_skcipher(cipher->skc, 0, 0);
b53fc4edb7faf3 Xin Long 2024-03-11  603  		if (IS_ERR(tfm)) {
b53fc4edb7faf3 Xin Long 2024-03-11  604  			err = PTR_ERR(tfm);
b53fc4edb7faf3 Xin Long 2024-03-11  605  			goto err;
b53fc4edb7faf3 Xin Long 2024-03-11  606  		}
b53fc4edb7faf3 Xin Long 2024-03-11  607  		crypto->rx_hp_tfm = tfm;
b53fc4edb7faf3 Xin Long 2024-03-11  608  
b53fc4edb7faf3 Xin Long 2024-03-11  609  		err = quic_crypto_rx_keys_derive_and_install(crypto);
b53fc4edb7faf3 Xin Long 2024-03-11  610  		if (err)
b53fc4edb7faf3 Xin Long 2024-03-11  611  			goto err;
b53fc4edb7faf3 Xin Long 2024-03-11  612  		crypto->recv_ready = 1;
b53fc4edb7faf3 Xin Long 2024-03-11  613  		return 0;
b53fc4edb7faf3 Xin Long 2024-03-11  614  	}
b53fc4edb7faf3 Xin Long 2024-03-11  615  
b53fc4edb7faf3 Xin Long 2024-03-11  616  	memcpy(crypto->tx_secret, srt->secret, secretlen);
b53fc4edb7faf3 Xin Long 2024-03-11  617  	tfm = crypto_alloc_aead(cipher->aead, 0, flag);
b53fc4edb7faf3 Xin Long 2024-03-11  618  	if (IS_ERR(tfm)) {
b53fc4edb7faf3 Xin Long 2024-03-11  619  		err = PTR_ERR(tfm);
b53fc4edb7faf3 Xin Long 2024-03-11  620  		goto err;
b53fc4edb7faf3 Xin Long 2024-03-11  621  	}
b53fc4edb7faf3 Xin Long 2024-03-11  622  	crypto->tx_tfm[0] = tfm;
b53fc4edb7faf3 Xin Long 2024-03-11  623  	tfm = crypto_alloc_aead(cipher->aead, 0, flag);
b53fc4edb7faf3 Xin Long 2024-03-11  624  	if (IS_ERR(tfm)) {
b53fc4edb7faf3 Xin Long 2024-03-11  625  		err = PTR_ERR(tfm);
b53fc4edb7faf3 Xin Long 2024-03-11  626  		goto err;
b53fc4edb7faf3 Xin Long 2024-03-11  627  	}
b53fc4edb7faf3 Xin Long 2024-03-11  628  	crypto->tx_tfm[1] = tfm;
b53fc4edb7faf3 Xin Long 2024-03-11  629  	tfm = crypto_alloc_sync_skcipher(cipher->skc, 0, 0);
b53fc4edb7faf3 Xin Long 2024-03-11  630  	if (IS_ERR(tfm)) {
b53fc4edb7faf3 Xin Long 2024-03-11  631  		err = PTR_ERR(tfm);
b53fc4edb7faf3 Xin Long 2024-03-11  632  		goto err;
b53fc4edb7faf3 Xin Long 2024-03-11  633  	}
b53fc4edb7faf3 Xin Long 2024-03-11  634  	crypto->tx_hp_tfm = tfm;
b53fc4edb7faf3 Xin Long 2024-03-11  635  	err = quic_crypto_tx_keys_derive_and_install(crypto);
b53fc4edb7faf3 Xin Long 2024-03-11  636  	if (err)
b53fc4edb7faf3 Xin Long 2024-03-11  637  		goto err;
b53fc4edb7faf3 Xin Long 2024-03-11  638  	crypto->send_ready = 1;
b53fc4edb7faf3 Xin Long 2024-03-11  639  	return 0;
b53fc4edb7faf3 Xin Long 2024-03-11  640  err:
b53fc4edb7faf3 Xin Long 2024-03-11  641  	quic_crypto_destroy(crypto);
b53fc4edb7faf3 Xin Long 2024-03-11  642  	return err;
b53fc4edb7faf3 Xin Long 2024-03-11  643  }
b53fc4edb7faf3 Xin Long 2024-03-11  644  EXPORT_SYMBOL_GPL(quic_crypto_set_secret);
b53fc4edb7faf3 Xin Long 2024-03-11  645  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
