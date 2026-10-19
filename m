Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429687;
	b=KpYvUNfFcFcgJjF7BYyDEeT4B8Zz7v6hi4QgGH/ntqjteeVonHwDrTr21tebKCr7UbsF
	 rd4SdClD1vJXgPp7nS1Wb7NC3QpKqM++Qwy8cmJ8V3q/ITEs6HUbjni1LekXGDBWjahAO
	 Xdc2H9lHTxhzG4Iv7uhGIbFOLiNUNRCksCf2O9WGaMseUaGTQR1LC57LhiiAibhH6Q8k7
	 2B0bhrSygPgNofsrw9K6oQvtiHa6qCO9ymifWGKOoJuVrgYzkmE5LKb9OHgXfkZVrNCgb
	 7PmuJPQ4OZyNBE90BOAacqkSvxPhfbxCjbVEQbLH3NZjv7+ank/+xhYgG7E2zuC6PLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=z9Rf2ubDKz7ML74MPtfck2qyU1vrqP5ztLplisyq7v8=;
	b=n4wuqtzcb9Z63NREZoK96JnZ6ZEGDp/8Foj7i1hCnOb2Tz6Vszl6w5ouwpJOyuBvKGyu
	 OX84CkxBNvy/eEsIhTYQ30gfk+GyPnRahsMA+8JhNBcICChtasofEBtq431YEnCBAwz4C
	 TRhWKrYbRZ/1KdorCxmN0ubKOEh/Q81VQdQX4VKJ9c6U3xs1iq7k5jSWkof9luLD9GwbU
	 HGqtmhldhKoQSUieDcfEul8raQeOWW1o5Nq5jWxa5WZf/nZ7HGmGf/MYxtSK2Yg86LIy1
	 uYdDynDLBvJx0/R0LImDq8kgiDqtrhHOf1r+BdohVFkroXMQLO7/5IeItTq3wVbqqWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mT4duZqF;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C28606A320
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 17:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C28606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mT4duZqF
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1436724f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 10:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429685; x=1793034485; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z9Rf2ubDKz7ML74MPtfck2qyU1vrqP5ztLplisyq7v8=;
        b=mT4duZqF2kRqTt7V5sp/HWkmr2qgriQwLYK509Aap9oJVpQ4oZUelS6Fs/qEiOTte+
         fKPVuYNiAvJ2ggbgksvfwGh0233Mqaf7x1aUfnN0oPsjYv2+au3OAyl27bEPLLDOIqyi
         yINSV7gZf1OLIhR6KW1ORzzpBUVs3T528RT3Z93A2L0y4MMQ7tp54fKpVUruipGm3GlB
         kJrVHGFjXRomH0+S3FKntEXVfrfRLuzwfphy90vwJqmjjyAub1K/aQJ54C58iFNCVV/J
         osvwVHt2ise7xBpqKWWpVJbGvEGt7T6yihyLlV5/cXW+DS/U6bB2YFFHcBI1MteuMhqx
         jT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429685; x=1793034485;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9Rf2ubDKz7ML74MPtfck2qyU1vrqP5ztLplisyq7v8=;
        b=uj/Ro2s8w4nl9olCtwyUKq29SVnbbK/OzeQX97Z0ymr7e4Fl8Xg7sLiviZ1vYT+dv3
         OHaSbA+FnG7RPozODZj9bv5cyelx17+s7kzWtY7J1KYM3DsCKVQ7ydhr9tAiU0ASGOWB
         HmxeMyDXNXfTSJfP5V90SZJv9MafH3y0j672vr4n9pa/02kVFXELgLaFPqKMsLFKGgRQ
         /FN061BE+HIiw8xacKzjweGzUYLCMaHCre0r7mMx/5TOTOSao2eutYvMaUNh53eIYDUO
         EMCiktL5fB5GY9ATeJfnVbClVGvltxr3hLu00jDJG2y3k39sTm9/vLISG9sc3VVY3SSV
         0VbA==
X-Forwarded-Encrypted: i=1; AKwUvBy5ckzUVBfz+BmuUcKN94xnRlhplz/0SqOyg2QMb+kqIvU+OiETnY/DUjdt0HeJSyzt5HVe86cogegCSKQf@lists.linux.dev
X-Gm-Message-State: AFq9FYJm41TtXIxiOj1ge3fC5yx1OOalviVr3Elnxh86XIvB/d4MU3X5
	T+PjQ6nzhnII7GlH9bIOPtbpBxff5qp9f0HMl59EgDT6y+bEGvcm4HeY
X-Gm-Gg: AYBFou1oNO7WPPlvRgkmybg+T+n7Bjzpv0qtQ1BEMQ0P5oh+MRySqX1+RtVhfYtvwC8
	J7iNiEtT+P9tYi+DDamaf1qFN4vt+3Gzw1Na3RIR7m8gcwWIri5VOeJOUOCD2I3y4RgLSuUAFQR
	zzBPo2END+y64kiMQEZiP1GIzSfB56osOMIbcguVrXMm6gPGOkZ7T0QH4eX8jGKNx4rx7fCTD+/
	M5E4GX8jzMvji4oz391KO/l+c5o2DkEfF7s0VU1KZ4r1Q+lUpCmqiDaPYC/dsgG1t0wVlQVu4a8
	yIZlroRgxa6+I3bChYMyIagi4faOqnDP8m8yu69pyem1nAGe/rHkySLeL2MwwNb/bNcwLatDe7k
	FYcyMYQbaQ8rXSuNVawJ8hM1aWNcWq+sKq/FPPOzt7GRb51fEM7Wf3dTLOZsjox+gFnh4dkRc+Z
	7sd5TACdT23WHCmzJKHMYYNMMnp6FoAqKBzg0NpS0ytr3a4zs5T8y+mp/8zdS60l0fSRSMv3M1A
	Av3GDT72U1YejnGyzWBt6yIN37OG6qiZ+4=
X-Received: by 2002:adf:e78f:0:b0:48d:ff81:5201 with SMTP id ffacd0b85a97d-48e07f99fa0mr12300471f8f.41.1792429685165;
        Mon, 19 Oct 2026 10:08:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818237sm146817f8f.27.2026.10.19.10.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:08:04 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:08:03 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek
 <pmladek@suse.com>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 bpf@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, Lorenzo Stoakes
 <ljs@kernel.org>, oe-kbuild-all@lists.linux.dev, Linux Memory Management
 List <linux-mm@kvack.org>, Luis Chamberlain <mcgrof@kernel.org>, Andrey
 Grodzovsky <andrey.grodzovsky@crowdstrike.com>, Steven Rostedt
 <rostedt@goodmis.org>
Subject: Re: [PATCH v2 next 03/15] kallsyms: Improve selftest
 test_perf_kallsyms_lookup_name() output
Message-ID: <20261019180803.3ff8c35b@pumpkin>
In-Reply-To: <202610192356.CItNLOke-lkp@intel.com>
References: <20261018155206.132411-4-david.laight.linux@gmail.com>
	<202610192356.CItNLOke-lkp@intel.com>
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

On Tue, 20 Oct 2026 00:07:48 +0800
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
> config: nios2-randconfig-1000-20261019 (https://download.01.org/0day-ci/archive/20261019/202610192356.CItNLOke-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 10.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610192356.CItNLOke-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610192356.CItNLOke-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/kallsyms_selftest.c:70:1: warning: 'The_time_has_come_the_Walrus_said_To_talk_of_many_things_Of_shoes_and_ships_and_sealing_wax_Of_cabbages_and_kings_And_why_the_sea_is_boiling_hot_And_whether_pigs_have_wings_O_Oysters_said_the_Carpenter_Youve_had_a_pleasant_run_Shall_we_be_trotting_home_again_But_answer_came_there_none_And_this_was_scarcely_odd_because_Theyd_eaten_every_one_The_moon_was_shining_sulkily_Because_she_thought_the_sun_Had_got_no_business_to_be_there_After_the_day_was_done_Its_very_rude_of_him_she_said_To_come_and_spoil_the_fun' defined but not used [-Wunused-variable]  
...

Already noted, it depends on the build options.
I'll use the same 'trick' as done for the other static symbols
(that is reference it from a non-static function).

David
