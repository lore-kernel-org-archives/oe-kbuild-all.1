Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F123234
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Mar 2025 14:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743430351; cv=none; b=BeKbwaX9T4JcZ54CAs7izGL7cspqzkA30SefK7SgzKYLYyWOButoNek7lV139o/DoB4mtYM24qVPIY840anEJUVEG05Jirp3Uj63vCASWvUwqkQSPtWdzdSKY7CEo0rCNiZ4F2msbJMkvoLyYrhu85Kifqt3dSocjsA6nMzvxTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743430351; c=relaxed/simple;
	bh=xagSVmpHTnLDCCcFMJRV70oFGFJbmteJKrIOuixu9M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yey+1gAL6L0xcJHDjp7VNpTlqguSGh4/6Np7ZZOTFvsAp3tbIHSklrd57+n8AKqOLt2gj5f63Yu2wHwRSuO4ON/8lbilHfbwdEwRMwG829zbtBh+zPQWo7lVqGnddCcxOEOE396qtgAXKoaN1dYZ8aDBOuSdg7sXDv8K46RUNJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/u3XD/R; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/u3XD/R"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39143200ddaso2929354f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Mar 2025 07:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743430348; x=1744035148; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i+vGUm3n8KY4m1ZzUGWaE6KA3TrnjWkcpmDMLLZVknU=;
        b=i/u3XD/RV3z6ahTYHrHEejkDVYcXpjC2Ao8NMgEl8VqJDApmUyVUtrTBDbc1fg/dUg
         BAB8K3mveFMvJgOdtvwm6/KuS4yL/qpBWqwTUty0UUDi7WP2aFJ/wnGIBwbmOi/3x5Ic
         oow/JBHRSHC/f5t5/n5wd4qy5bqgxe0zrfpknntzKaGDflZXIKkYDxZV6fXRqzpoFcX/
         xfBy9RjR7nIHi2P+FceSvpWxo0yvGAu3dGmYTsX2YakMGd+HQnmxxYhC7dyS4XCjdGAF
         v0BW/MAoyFDivlbGcDFz+cWAmdwAI+ISLMNcXWepRkaZrUcU+p2Qh8tveWIwbe/XAdxZ
         yu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743430348; x=1744035148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+vGUm3n8KY4m1ZzUGWaE6KA3TrnjWkcpmDMLLZVknU=;
        b=E4M6mHgEde6wBXpS4ukgd5EIwCPmFYfRPJzAF0OdFMnKftB0X2NgIEquvYrwFhwkNX
         QwbeyoWrLn7fR+kqS7jgVvUIRj7ErxBWjDIPOV8P0UnPzboXpo3mnsv36wyyY7X67Wvu
         iyiFMbvYWQxg/8jcDNFzW1E9HHHWHDRIeCDh30arA5W4nyY/aJuQi9gL3jTLZnLjz5nI
         8U6huKdoNgcZSgoKu1s62be0EAfJZUd93sPOY8Xw7c3GvUieUk8lExR8o/sFdXKn4Rpv
         LasynElZ240DYJp+XvjPpzguR8mgV/WjNLkMuEzO8NbDZ4eaXdOhteQMFUe/aW2pUnPm
         Zg2g==
X-Forwarded-Encrypted: i=1; AJvYcCUuTTK+SQ5JQSFNna0R++601/HTeCmNVZRPdpeXwj+migx0HqWUUA0wQb/Jdm/EJWpqMYDdSBXHqaLgKpLh@lists.linux.dev
X-Gm-Message-State: AOJu0YyM9m1EjCRagcsi18lWSUcNtXPWPDyuYRoSbG1/g69n1K0hEQBD
	l8cjd8YQFUFqJRsdTN+hpJCXR2BE1q6Bu78IU5Czcnq6A/uTYjBY
X-Gm-Gg: ASbGnctFp2FXiZLF7t8BfWI4mwE7VUItRrKt9Ww1fegg/rx5+tEfDeYDizFKkCOXx0G
	gZTAY1Tp6yFrhj9hf2i/qSUivb9fXHs7Y5+ONA/gbf8HzVgdP81bSaHp9zJPY5vObv5+GPziqpk
	cxAkRimJNtNd7nA9HMO7LvjZa5TM82dnydCVPhPxtvIdoRL8xnFWQ3uS6zadqIOdsH5629Ky6/F
	j7k5i12GTlShILRFo9hma0aGmey7vRyX83Sn7tZpfrqQL8dNYm/NR8vENoYFJGEXPgXaAFySVZd
	5zlZmp+mvhdwzWZMFA4vZVgW6Ghe4dWXtgm88yHAG2VYLylWus+fFAEiculirYE6LBiWqbFKcmF
	DaoaRsj4T
X-Google-Smtp-Source: AGHT+IFPS+ohYLpujbP+VCWOVIT0+NAeDNZJWjd2vswfyoVHsti6gfj/6NwZujKD/GHKfgTVNfnPZQ==
X-Received: by 2002:a05:6000:2483:b0:39c:142d:c0a with SMTP id ffacd0b85a97d-39c142d0c38mr5370822f8f.19.1743430347820;
        Mon, 31 Mar 2025 07:12:27 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e311sm11484777f8f.78.2025.03.31.07.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 07:12:26 -0700 (PDT)
Date: Mon, 31 Mar 2025 15:12:26 +0100
From: Stafford Horne <shorne@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Sahil Siddiq <icegambit91@gmail.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 13940/14141]
 arch/openrisc/include/asm/spr.h:16:27: error: impossible constraint in 'asm'
Message-ID: <Z-qiyls8IyEjj7xT@antec>
References: <202503311807.BZaUHY5L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503311807.BZaUHY5L-lkp@intel.com>

On Mon, Mar 31, 2025 at 07:05:53PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   405e2241def89c88f008dcb899eb5b6d4be8b43c
> commit: c5c6fd8be51207f0abd3e5a6ed4fd5220b0bdecd [13940/14141] openrisc: Introduce new utility functions to flush and invalidate caches
> config: openrisc-randconfig-r062-20250331 (https://download.01.org/0day-ci/archive/20250331/202503311807.BZaUHY5L-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250331/202503311807.BZaUHY5L-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503311807.BZaUHY5L-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from arch/openrisc/mm/cache.c:13:
>    In function 'cache_loop',
>        inlined from 'cache_loop_page' at arch/openrisc/mm/cache.c:51:2:
> >> arch/openrisc/include/asm/spr.h:16:27: warning: 'asm' operand 0 probably does not match constraints
>       16 | #define mtspr(_spr, _val) __asm__ __volatile__ (                \
>          |                           ^~~~~~~
>    arch/openrisc/mm/cache.c:38:17: note: in expansion of macro 'mtspr'
>       38 |                 mtspr(reg, paddr);
>          |                 ^~~~~
> >> arch/openrisc/include/asm/spr.h:16:27: error: impossible constraint in 'asm'
>       16 | #define mtspr(_spr, _val) __asm__ __volatile__ (                \
>          |                           ^~~~~~~
>    arch/openrisc/mm/cache.c:38:17: note: in expansion of macro 'mtspr'
>       38 |                 mtspr(reg, paddr);
>          |                 ^~~~~

Hi Suhil,

This is due to reg being defined as usigned int in the new cache functions.  It
should used short as the SPR_* regs are limited to 16-bit addresses.

Could you fix this and resend?  I tried to recreate this with gcc 14.2.0 and
make W=1 but didn't manage to get the same error.  So pleae check if you can
reproduce too and fix any other warnings there may be.

-Stafford

> 
> vim +/asm +16 arch/openrisc/include/asm/spr.h
> 
> 58e0166a4772aa Jonas Bonn 2011-06-04  15  
> 58e0166a4772aa Jonas Bonn 2011-06-04 @16  #define mtspr(_spr, _val) __asm__ __volatile__ (		\
> 58e0166a4772aa Jonas Bonn 2011-06-04  17  	"l.mtspr r0,%1,%0"					\
> 58e0166a4772aa Jonas Bonn 2011-06-04  18  	: : "K" (_spr), "r" (_val))
> 58e0166a4772aa Jonas Bonn 2011-06-04  19  #define mtspr_off(_spr, _off, _val) __asm__ __volatile__ (	\
> 58e0166a4772aa Jonas Bonn 2011-06-04  20  	"l.mtspr %0,%1,%2"					\
> 58e0166a4772aa Jonas Bonn 2011-06-04  21  	: : "r" (_off), "r" (_val), "K" (_spr))
> 58e0166a4772aa Jonas Bonn 2011-06-04  22  
> 
> :::::: The code at line 16 was first introduced by commit
> :::::: 58e0166a4772aaeb10c9b0f6d59f19099d2047df OpenRISC: Headers
> 
> :::::: TO: Jonas Bonn <jonas@southpole.se>
> :::::: CC: Jonas Bonn <jonas@southpole.se>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
