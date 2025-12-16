Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0397C23BF9B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 19:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765912803; cv=none; b=kZnjeH3x4//fXpIGbccMmhLd9Tv18wFdXbYFEE6mkMCKvt5RJHPORkwsxUqTFWxNCoAGjX76+wiqT3Nd7+uBXcOhoEh9aP8kPQ2jWm2ARDE/KN7LxbFAS2t9HcmvqP9QQgQT9u/vQUlGCja9emhy37w/eyD+yXCgOZNOTaSMTxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765912803; c=relaxed/simple;
	bh=wbuC7f+YwQs3yAUD0i5MGl36WkKVCnDCGLPdwkv8iBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIxOugXsu/YMsrvI+KSnzmkOHM2VFjQ+LVUNiBI+SnZAOuWybVVICxCyigceDBG2YIvZb1ii4TRkHXsRAvY0xiDBQUNc7x+HQAQHVcx0tMupOySl7tB39r/gj8aQKLm5HjTT/wYyjEB5EeiIBN4Icn6NkLaX+wD8QXkvyRv1xgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njv4r09M; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njv4r09M"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88a346c284fso28754936d6.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 11:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765912800; x=1766517600; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NQ14X5JEjmypnmXlTSEqHdjuNgrenL9q/KzW4531Dcw=;
        b=njv4r09MAdH73s9lfVA6OGfJzV/Wmw1KZWt4LY3qBZzOo9DaylE5B34DUkyuH1WeRz
         c0rb/UK6EzUnPBiBn8tAxAvtTQYnPDsFcZ/uv0u2yEFLLnYXmyU4I0SoKKbwf/nQsnHt
         q9U+IVqzKE2vyvVvt18p6EU2sd2sO2H4WffsU1YsArR5ucVq7ouqYn7J06htIKyZEgtP
         NI+GjrhaPHQPxWFm6272rKrSmoFTC/E4KXjBEGprpM/rOCdKDkpvGGLkQyAAvPZpmXlM
         TOi3ENRZmtYM/r40x4hjJor5SPc7AKh8I0E8vHPZQScWN0KewbOFMnvBzUtyEVSGVXgL
         nftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765912800; x=1766517600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQ14X5JEjmypnmXlTSEqHdjuNgrenL9q/KzW4531Dcw=;
        b=KTck9K5W8Um+rx8yy9N2dAsIbkzwqzSubUAxbDUgwVy9zfyz0jn24EUjDyZGp40hsA
         I84oRpFv8XyIpqA4Gw4IzOd5NrN8052pFi/x+cY4Vk+Mnt2fbosJDtV7OJEqVba3tAm6
         978xzKAcZEGGiP9YTSm65U0VJMKuObT1JsZe71bJB8CzM0CUOrbRDLFOI+exMFWW7njp
         c6MaZHggnx506jqVCdg9WjsDW1Y7XoY6TjMgkU/jP6w0luPKc/FIz6gWgqSNBzVvYF5Q
         zQLwBbHQS1YHbqTJNimYGbOZC4aQm/S8iKUm29dhGkMSZE5j3olth2lDyHXptTOECOc7
         Tz0w==
X-Forwarded-Encrypted: i=1; AJvYcCWEdWSXi8yWOtQeqPSR6pX46B+lAbPs1mifVPGAetthpBNDj1uFSaxxx7S8o1ya50Ru6c/F0HTAg4YnXuNp@lists.linux.dev
X-Gm-Message-State: AOJu0YxSsq6pITvIuVE8GcvivmvQPDZkvPcPd3JZO2N695amtLX/TVWv
	9mdJ/RRks0+0XULWZLD3nAcfmr2oggQO4wZWdYmwzadeGfcYMIFdn9E+
X-Gm-Gg: AY/fxX6QHJiNp6BjyTpOXkNPy20g5ah7zfqk/rXjpUUjQ3zfBvbDmVPMRQHIe/g7oLI
	wiYr0vsMQ26QlxhXnFOJ8RraNnNEFgOJmln+0Ia9q70/YdLlOq7oa0BFxYSWOJtdPpXotm68lFY
	C+/a7Hfm3rueyqarA80v0YaHp9S+Jhr8pZnFYOKGvwWfAUDUMnu6zOZKX1aLP7/kU/bzTN+cyHm
	yornCX/nNvliE+mrcEAz3dRg/LY0gxLWYTUEPGTWYYTsF4YZdd7IRAU0S8J3h8VURxgEbhqjqX4
	6b/OjBjo36nvlTUDxfSlGKhyCHNEwdTnGUW1Ww79jk5TrNXtABdythSMGQwQBHaoVJ1KM4oBTj6
	vtyQi8gYOWBC0OYYjBXifg1A2zlMimXM/bcdfGel9aAq4elxxwmWaGsdtt6cqAmPGDgGrg6b3pb
	2SqtSrgC4ck0AuLw==
X-Google-Smtp-Source: AGHT+IGBXscolMBOLTp10k4lilqmJBXjCe0U6KcoQK5MG5Zp5UFmqbw1ed6GUJtUUZg1YYBjf/JwiA==
X-Received: by 2002:a05:6214:528c:b0:882:44cc:f572 with SMTP id 6a1803df08f44-8887e01ddfcmr282757316d6.20.1765912799766;
        Tue, 16 Dec 2025 11:19:59 -0800 (PST)
Received: from errol.ini.cmu.edu ([72.95.245.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88993b6a80fsm79637266d6.18.2025.12.16.11.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 11:19:59 -0800 (PST)
Date: Tue, 16 Dec 2025 14:19:50 -0500
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
	oe-kbuild-all@lists.linux.dev,
	Mateusz Holenko <mholenko@antmicro.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [litex-hub:litex-rebase 14/15] drivers/clk/clk-litex.c:942
 litex_clk_calc_phase_normal() warn: inconsistent indenting
Message-ID: <aUGw1kG5LHz4FVym@errol.ini.cmu.edu>
References: <202512140644.gN3YELGj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512140644.gN3YELGj-lkp@intel.com>
X-Clacks-Overhead: GNU Terry Pratchett

fixed and rebased in `litex-rebase` branch,
(at https://github.com/litex-hub/linux.git)

Thanks,
--Gabriel

On Sun, Dec 14, 2025 at 06:38:10AM +0800, kernel test robot wrote:
> tree:   https://github.com/litex-hub/linux litex-rebase
> head:   bf1103a7647b9e371007e1f7d02827190e619900
> commit: 553f9a11b145aae5c68d5abf17e5fa38a3a93426 [14/15] LiteX: driver for MMCM
> config: csky-randconfig-r071-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140644.gN3YELGj-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 15.1.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512140644.gN3YELGj-lkp@intel.com/
> 
> smatch warnings:
> drivers/clk/clk-litex.c:942 litex_clk_calc_phase_normal() warn: inconsistent indenting
> 
> vim +942 drivers/clk/clk-litex.c
> 
>    886	
>    887	/*
>    888	 * Calculate necessary values for setting phase in normal mode
>    889	 *
>    890	 * clk_hw:		hardware specific clock structure
>    891	 * divider:		frequency divider value for calculating the phase
>    892	 * fract_cnt:		fractional frequency divider value, if not for
>    893	 *			CLKOUT0 - set 0
>    894	 * phase_offset:	desired phase in angle degrees
>    895	 * pointers:		function return values, used for setting desired phase
>    896	 *
>    897	 */
>    898	static int litex_clk_calc_phase_normal(struct clk_hw *hw, u32 divider,
>    899						u32 fract_cnt, u32 phase_offset,
>    900						u32 *phase_mux, u32 *delay_time,
>    901						u32 *phase_mux_f, u32 *period_offset)
>    902	{
>    903		/* ns unit */
>    904		u32 global_period, clkout_period, post_glob_div_f;
>    905	
>    906		post_glob_div_f = litex_clk_get_real_global_frequency(hw);
>    907		global_period = NS_IN_SEC / post_glob_div_f;
>    908		clkout_period = global_period * divider;
>    909	
>    910		if (phase_offset != 0) {
>    911			int synthetic_phase, delta_p, min_p;
>    912			u8 d_t, p_m;
>    913	
>    914			*period_offset = litex_round(clkout_period * (*period_offset),
>    915									10000);
>    916	
>    917			if (*period_offset / global_period > DELAY_TIME_MAX)
>    918				return -EINVAL;
>    919	
>    920			min_p = INT_MAX;
>    921			/* Delay_time: (0-63) */
>    922			for (d_t = 0; d_t <= DELAY_TIME_MAX; d_t++) {
>    923				/* phase_mux: (0-7) */
>    924				for (p_m = 0; p_m <= PHASE_MUX_MAX; p_m++) {
>    925					synthetic_phase = (d_t * global_period) +
>    926					((p_m * ((global_period * 100) / 8) / 100));
>    927	
>    928					delta_p = abs(synthetic_phase - *period_offset);
>    929					if (delta_p < min_p) {
>    930						min_p = delta_p;
>    931						*phase_mux = p_m;
>    932						*delay_time = d_t;
>    933					}
>    934				}
>    935			}
>    936		} else {
>    937			/* Don't change phase offset*/
>    938			*phase_mux = 0;
>    939			*delay_time = 0;
>    940		}
>    941	/* Calculating values in normal mode, fractional control bits need to be zero*/
>  > 942			*phase_mux_f = 0;
>    943	
>    944		return 0;
>    945	}
>    946	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
