Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8082E1FBEA4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 21:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747605040; cv=none; b=HUW5KkZuZTTye0PxQJ/1n7dhpp/l8eFF2H/vexdpKazIFRuM6yJEqEGGGx4qovX9W1f46lT+BnYRvmAvtdc/zN56t83o2vqWVO+p1YqkLCUS3CSduA68HiooifIecwPiv9L+0+mqwi/E+fcXxvHJbKyEanaJ/Zmdl1WksRA0b+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747605040; c=relaxed/simple;
	bh=79kKnSEMKKqJ57YQnRDp4qba0VqmcjJ6iTAvPSXrnL4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bU0lC39euF7QbXc8bgjMZ8/45Gvf9TjTFNCrmwOcjBZ9iTkGUBS2oz0XWM39gYhC4EIecvDLX4d09ZKKp8PAkxNg1kbo9vfVnZiaVlqRjKhw56pNtFGn3zUHwPVq7ipCIy/jgdgE8gdRmfTsRFIbd34MuwtkvdcyHXOLO5zPPVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ejo28Gsr; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ejo28Gsr"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a361b8a664so2377248f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 14:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747605037; x=1748209837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dd87LfCI9WT//JyBxng83Lwb28MCQOSv3z3z3fk1VZs=;
        b=Ejo28GsrEGSzLRWik+7yJotLjvY3+HGltOMy2uRu5WvapO9J036Zr7+hUIwKOyXMK8
         p4RKLvToiee/7mKOQZTdgwRx9nmOZo8CVV8jOzXQElFOZyPgh9Ru/wl957QLRFc1F5v0
         TWAj7YzlvJR1dbUw+2j210YIYsbMO+oHNzXcDyPztJtYVOB5mXTYxcJa3uH3IOBSnRCG
         oV1Fe21Rxmyl/8TJNaBTlbtRT+Ax5q+B5nCawlYmtbi4r+1IwYttvSK7ZY8zlSduE2ZQ
         rC1UGAa5GURlWjWZ3cn1suQkABfVT7oA0sMGmXovkzvhWiO5qsfHUWG0EDZxtBzRJPA6
         YPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747605037; x=1748209837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dd87LfCI9WT//JyBxng83Lwb28MCQOSv3z3z3fk1VZs=;
        b=Sw1S2DbJ180z+6EbgTwVlTIVxiF6TLpMt/eXm419eHIGzGUJJkUeTY3ffwUbBGZOQP
         9fdfhv7tcfqACCxS3KKjOzTIu8NxUdBltBIQWjfQIDiRRBoGM+OSK3ldzMk5xzHEDxzP
         IsrT56RMMIdTbt9tYvDQ/7bmLmHGewgrdDx8ClvB29QzHU88gp8vwLLuRKLWQQHIkgVV
         jw79QuHHFkBZIY5MWM+/e86UWobpM/t2CkfxezVddFauKz5nS+snGwGX1WWauwmK58Dg
         2hYgbnfBQXcJxlzG0lIEiiZbEXBVNZ06jOmhl1gbGb8TJYxK2bUkZOLnGoT6At3wr+gP
         Ttxw==
X-Forwarded-Encrypted: i=1; AJvYcCVALPJ0aqZ23W4V8lqZl+NZlL/uwdDHTZmAsomj8SvZ72UM4I0Fd/9OMjD+YGSR0IwB1jMZWHvwZd27R7lX@lists.linux.dev
X-Gm-Message-State: AOJu0YxMIFyrWuhSSdiyg/RVQ8Xk/iMshHlo7Dv+QMTQr2mAZs+SNnJW
	qtz+xrHW8pSUIz4cKFwvGaB1zHKNDJuVcqlviJrUTAh9nCHDYDNchHF+
X-Gm-Gg: ASbGncuF5WiPM0suwH/n/R0CAFJ+VyeFb+VvYERRM6dAB2ucdjsNMqiqDzAJlCD29L3
	/NdeAyN1taFcUysJKXGCAiBJiQ8VbwhasAViiZejc1JiyK8Ire4CfTXcd6eRP0lUtZrQClB21PS
	PNZ88LaMH5DkjRffHIiVCFdAFgtdMaOBb4Hh16HD4hO+3y22Yor9Ml1SaGpQQJ2nV9CU4lJiBY2
	MSDkG6wYKU8g9jQFkZvMXdygU+kWLyzAX69SW62gtZ5zG54X7hxQy/SjK1FqKIevevwJjM+Zpj9
	8rj39mSY8SumQZv+eQjf/n9cPvFFk9jN+pcmx99u28qWx9fpGdmvv70Y3SRLdWQXv3FUrt5j0h+
	mA1IQ3cbNuiW7qw==
X-Google-Smtp-Source: AGHT+IEoBiFPjelVAhh1P9nAn5mTVvxWL2CpLAah1CB9KofEoCk75lEIDvxxHgFp9MPCtfEn5qQMcA==
X-Received: by 2002:a05:6000:430c:b0:3a3:6947:6d35 with SMTP id ffacd0b85a97d-3a369477158mr3953400f8f.57.1747605036646;
        Sun, 18 May 2025 14:50:36 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8d005sm10670936f8f.90.2025.05.18.14.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:50:36 -0700 (PDT)
Date: Sun, 18 May 2025 22:50:35 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, u.kleine-koenig@baylibre.com, Nicolas Pitre
 <npitre@baylibre.com>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 next 2/4] lib: mul_u64_u64_div_u64() Use BUG_ON() for
 divide by zero
Message-ID: <20250518225035.2f887be7@pumpkin>
In-Reply-To: <202505182351.bPFZE1vO-lkp@intel.com>
References: <20250518133848.5811-3-david.laight.linux@gmail.com>
	<202505182351.bPFZE1vO-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 May 2025 23:42:44 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi David,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on next-20250516]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/lib-mul_u64_u64_div_u64-rename-parameter-c-to-d/20250518-214037
> base:   next-20250516
> patch link:    https://lore.kernel.org/r/20250518133848.5811-3-david.laight.linux%40gmail.com
> patch subject: [PATCH v2 next 2/4] lib: mul_u64_u64_div_u64() Use BUG_ON() for divide by zero
> config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250518/202505182351.bPFZE1vO-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505182351.bPFZE1vO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505182351.bPFZE1vO-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    lib/math/div64.c: In function 'mul_u64_u64_div_u64':
> >> lib/math/div64.c:190:9: error: implicit declaration of function 'BUG_ON' [-Wimplicit-function-declaration]  
>      190 |         BUG_ON(!d);
>          |         ^~~~~~

compiles fine on x86 :-(
