Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F78438399D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 06:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849142; cv=none; b=jD6OaX3AFLEz081HjcG02IgaQ1TZGI+lZ+ExTk2kb9QhQurMsHAYMAl95nWilPGjNIKLsTtiGjyQq2JqJaw+RKVk1gU787DbGWJyuedw/jgau4wbWsau2a8JfmfeJ3iKXxAjINbOuKIjLfJOgBllWD7fAJJ12sHndzotvckWC8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849142; c=relaxed/simple;
	bh=L3RSKFtIiq3xfmKS2Lj+8AFAnQ225FnH4Uu6XJr58TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjWICXVpocgHcJIIo59iq8Dr27bpinsXhzF8pXx+wh6kPBEOIwFJqNDaLsBpSzo/W9vTRB3YWhxff479R+tZRyshpnRpoRnpPLHtn7T5elEouZENDQStwlbMBBODxBq7tH15RIIZpjyCFWiz8hZJB/G7BPJsZ6LAb4+nnx6Dv0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2UWh2U/k; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oCjjh3Q0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2UWh2U/k";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oCjjh3Q0"
Date: Tue, 8 Sep 2026 08:32:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788849139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oVxz4PesroIY7DrVUMPxUwuaJq5+NpOilofYt0q3YPM=;
	b=2UWh2U/k6JVjqeUTgYL82dCQ8FX999zeuKdcQphGlx0bkiGY+JsrP5+P/2jVj6Es6UlSlj
	nPG7atpdiadgTZo2lQlu4KZeo28mWWJ9v1+YUWQkgFe5+5zDwh9tJfXrafWDwZ9ZN+rJZF
	1bvPDJDwYH8a++CkgVV4tfsdzvG79tXX1MKESsuzopzRgM95GjlHTmC3wicoZGHBtOQ3GD
	hUmmFetwZaWVVX2+Jw6WeZsWGlrllSe5X1z58jPqVEjzPgkHQhh5T114nwqEciExMEOhPL
	PXHrWsA4PC0P09RX/prVWO1RTs85hLbndbDtNe9hVIRXrEUKL0Da9Zw2iBNcpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788849139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oVxz4PesroIY7DrVUMPxUwuaJq5+NpOilofYt0q3YPM=;
	b=oCjjh3Q0mPiTpxIg2mzYSlhbEAlJQ0vfhTYwlHrHnNCIDLDK8VeDHQTj8sc1RardAetnaa
	tIRNeurpVu176WBg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: lib/vdso/gettimeofday.c:288:31: error: implicit declaration of
 function 'BITS_PER_TYPE'; did you mean 'BITS_PER_LONG'?
Message-ID: <20260908083031-c412d00f-6541-43d7-b81f-0e70c093c2e9@linutronix.de>
References: <202609080117.XY9u2XZ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609080117.XY9u2XZ9-lkp@intel.com>

Hi Zhan,

On Tue, Sep 08, 2026 at 01:42:57AM +0200, kernel test robot wrote:
> tree:   https://github.com/intel-lab-lkp/linux/commits/Zhan-Xusheng/vdso-math64-Add-and-use-__iter_div64_u64_rem/20260901-100634
> head:   70e38aef8fc8b80bc60e2249e5f2a38c2d1e604b
> commit: 70e38aef8fc8b80bc60e2249e5f2a38c2d1e604b vdso/gettimeofday: Assert that the clock id fits the dispatch mask
> date:   7 days ago
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260908/202609080117.XY9u2XZ9-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080117.XY9u2XZ9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609080117.XY9u2XZ9-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from <command-line>:
>    lib/vdso/gettimeofday.c: In function '__cvdso_clock_gettime_common':
> >> lib/vdso/gettimeofday.c:288:31: error: implicit declaration of function 'BITS_PER_TYPE'; did you mean 'BITS_PER_LONG'? [-Wimplicit-function-declaration]
>      288 |         BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));

Instead of including linux/bit.h from the vDSO code, could you move
BITS_PER_TYPE and BITS_PER_BYTE to vdso/bits.h and use it from there?


Thomas
