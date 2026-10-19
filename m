Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445127;
	b=x6Jno0k0KuF19X6rJ8h//3XvMn6Jho2hT1VgzGekqttvfolGzfpmcY0ucEi5cVscgf9G
	 cct4VuDJWgTGJYP6LxWxQnjDfD8/zj7OyCSCnYxVf5uqHEdWfGCxv6rSzoG7nrQWnrWo8
	 Oc2e+ELdnYJbq0/5V370iqiOLgJuXEpt9GkqiiFwcpLZbVv4IN2/Hj8rCegNG7exBW6FX
	 blzbcbu0RAndPIF1iFZmdG4X2Zrv+cvZ1Fa9scaaTBRHDiPn22N4KiRq1EuE7h2RlQDJQ
	 KD8N/w0y9jOZ++KcWLlY5TAvDdn8OdCYlsoUmZTYoB1T6cNCP0R51ppCpcdllvX6luw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bqwC/Ywk/urErM3liCKcvDfgOsAI1aXiD3ThAOoBayk=;
	b=jKzem/P3jrYNIijgXSeSq4Xb0741wo/CV5a7VCTz1IA8RrRUGvHAwzgGidvh3Q3qSADr
	 B/3T09pbWRTdOI1EmQQa19IPNGih14n1VvOS7i12H+uiiDc1duztQ3Az7Hd0ICs1JaqeG
	 BGNg55sVFtoZ8i7n1QHJZD5MAZpaxs5nT8wEwkjL6WWTHPyo0mRqOwjdymhXt+nuiBGa0
	 fZtNCMLmCWUyaGbD7I81B23zPbfs7VhlW7Jaf1rReG+ICvczmqz3VZ+gMxQltASq6h/l7
	 8GmWYyYF1gMR3x6WohqBGH9L6TZRlgHU6gpJe8ikWYxNlP30WD7JlEHTtKP85imywvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=itDUHLdI;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666B0606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 21:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 666B0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=itDUHLdI
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso16284875e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 14:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792445126; x=1793049926; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bqwC/Ywk/urErM3liCKcvDfgOsAI1aXiD3ThAOoBayk=;
        b=itDUHLdIepQVIvQlnig5A4A03myxzoFTGvol0IGglsjVpwNUiY8faImKzMUMs9FFm3
         RzYFr3AzNaGiHONTKV6lFlvhyC3VWKY59X9ICdrrVUNVm8HeJ7hikxC5zoRmg/CE9ntu
         qxhNrGGL/zsYaEc5UpDierf4O1UOrjX4h/BE4pFbWVlZ4yyy7i1sqKhft1kT2aWy0AvL
         pPUiSkAhFZmyfFfbSBOOII5q3ic+wWUemLyVyKvMFXbnvbMnkXv08wh+HUhRI690FEyK
         ZuKtzhzE6ln0jDQIr/m20t0xftepq6plPm6yv9LdQIl2wOJM/MxCe5YjDuAbP6aHxbFe
         aiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445126; x=1793049926;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqwC/Ywk/urErM3liCKcvDfgOsAI1aXiD3ThAOoBayk=;
        b=EVlMjGQ9vktVp0E4PAvMZKJkQ99tbgcg3THA3Al12IHqSJD2Ec+CLu9KeOw/sWGZcx
         kdjTEbFMm52r1KAXP4qtIy3GRRgr8+hfM59D/SNoiyBCOOD7n4HS/JRQwfgfJbhMQqoP
         S3Gph3Q1aJdxM1CyjD2D2i4ZEIoLkOjLVXRil/ySemzSYgKfE5WsvU1IGjt2r/Y4Q50C
         S9DKB+TJawsaIXkP2rG/6FKfV7M9x/ZeMZgt2HI7Co0FozL0EzxSZD1Uoe5xVexdda65
         aJAPDnj8AoRpAopBHuzKtVSj4IJJ0kRFY0+ooem215GR04MOs0P1Cx6hopdOGMXyYPem
         3gJA==
X-Forwarded-Encrypted: i=1; AKwUvBxXZg+oOTNA3olCwqADq5LimZcXRwzLI0ZsuP2OO9P3Nd9OtCmvFKb9oBHrXmF/rMxlb1v3dyJH2/t5w4SK@lists.linux.dev
X-Gm-Message-State: AFq9FYINrcExs9HoD0MMeJMMNIP4bUmy47nTZ8JZV0U0bB+atTmr3r3k
	X0XmJqrMmAEekylj7406t5bcxVqydRtf0nyhhh/pvX1DSEQlNOwnxyvu
X-Gm-Gg: AYBFou1/WTA+6EKBAFYyQk1DOYEQfDKIcQbD7ycqv7g8v0LLiv58AdPz9UX5iIEXiCK
	HNf0AF1Ze6lDDGYIdR62amtdF6E3lQBe6L42llIC1bjMvsHB3Hji8C7W1W/LaGYIluAMx/xOVtE
	Xuqard7ni+hr35juDVCFuTcOf64kxnXSIkwhqjfBAYwU2bOevJ4I56W2+8XLLMOjECLWBkSFEHx
	nrtI8Vlz04HAf15Ny1Fbxv25iZgM1+02itfzZQdD2jPiDJXap60wQlbENmkhfCFVd2iCAKkqiCA
	pEawcJiOmjPUePqtWvgK+fQMaA9DJjhV6gvq4/0Q35d/UGU0D3CuvujbZhKTrxGsNVPJ1BQyNw8
	9/Yzog9Oo18Cosylb/Zh5thDJPKWM7JcK0xSU+FKaLVGSnYCYBnkMOy4iO8K/FEXGVS3ZgivC60
	Bv4wGJiFoLxY3HL5kT1ct72qexYUN8bVOSH0hVRtGZqPTBGjJVDtw3fAsdf8xy0XqKd2xeAWsxd
	eApF2InwbpNQ6QG4e+r0vysMxzCrIBk1v0=
X-Received: by 2002:a05:600c:c8c:b0:4a0:bc9:28c6 with SMTP id 5b1f17b1804b1-4a1d7643dadmr171548545e9.34.1792445125587;
        Mon, 19 Oct 2026 14:25:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c1e0e6sm25118305e9.0.2026.10.19.14.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:25:25 -0700 (PDT)
Date: Mon, 19 Oct 2026 22:25:24 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek
 <pmladek@suse.com>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 bpf@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, Lorenzo Stoakes
 <ljs@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 next 03/15] kallsyms: Improve selftest
 test_perf_kallsyms_lookup_name() output
Message-ID: <20261019222524.695a4d31@pumpkin>
In-Reply-To: <202610200434.qSHPOyDo-lkp@intel.com>
References: <20261018155206.132411-4-david.laight.linux@gmail.com>
	<202610200434.qSHPOyDo-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 04:57:54 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi David,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master v7.3]
> [cannot apply to next-20261016 next-20261016]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/kallsyms-scripts-kallsyms-c-Avoid-overrunning-on-stack-buffer/20261018-165152
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20261018155206.132411-4-david.laight.linux%40gmail.com
> patch subject: [PATCH v2 next 03/15] kallsyms: Improve selftest test_perf_kallsyms_lookup_name() output
> config: arm64-randconfig-1000-20261019 (https://download.01.org/0day-ci/archive/20261020/202610200434.qSHPOyDo-lkp@intel.com/config)
> compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200434.qSHPOyDo-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610200434.qSHPOyDo-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/kallsyms_selftest.c:82:12: warning: unused variable 'The_time_has_come_the_Walrus_said_To_talk_of_many_things_Of_shoes_and_ships_and_sealing_wax_Of_cabbages_and_kings_And_why_the_sea_is_boiling_hot_And_whether_pigs_have_wings_O_Oysters_said_the_Carpenter_Youve_had_a_pleasant_run_Shall_we_be_trotting_home_again_But_answer_came_there_none_And_this_was_scarcely_odd_because_Theyd_eaten_every_one_The_moon_was_shining_sulkily_Because_she_thought_the_sun_Had_got_no_business_to_be_there_After_the_day_was_done_Its_very_rude_of_him_she_said_To_come_and_spoil_the_fun' [-Wunused-variable]  
>       82 | static int kallsyms_very_long_name = 1;
>          |            ^~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kallsyms_selftest.c:69:33: note: expanded from macro 'kallsyms_very_long_name'
>       69 | #define kallsyms_very_long_name \
>          |                                 ^
>    1 warning generated.

Duplicate, depends on config options.

David

> 
> 
> vim +/The_time_has_come_the_Walrus_said_To_talk_of_many_things_Of_shoes_and_ships_and_sealing_wax_Of_cabbages_and_kings_And_why_the_sea_is_boiling_hot_And_whether_pigs_have_wings_O_Oysters_said_the_Carpenter_Youve_had_a_pleasant_run_Shall_we_be_trotting_home_again_But_answer_came_there_none_And_this_was_scarcely_odd_because_Theyd_eaten_every_one_The_moon_was_shining_sulkily_Because_she_thought_the_sun_Had_got_no_business_to_be_there_After_the_day_was_done_Its_very_rude_of_him_she_said_To_come_and_spoil_the_fun +82 kernel/kallsyms_selftest.c
> 
>     81	
>   > 82	static int kallsyms_very_long_name = 1;  
>     83	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

