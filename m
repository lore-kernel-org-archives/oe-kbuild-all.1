Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC5519C566
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 13:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765718266; cv=none; b=GtSzZJMhcKg9RpCNCwiQq6LW47w9e0pSmUNqkErsZLlLU5pVqMg0/XkTZzElo/6W+uccqR2ISJP9aU2XbVHpukRE+GtLskTw7FaRGpMwnGyg2SB1s3gFanulTGd0htaAmtxQnvu4xXxhrdDt5mJ/qSOv1q1n3fIPV50WnGpel6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765718266; c=relaxed/simple;
	bh=XmtOq1WlOXv5tvapcKs/oIm0cZgNGon3Gb1VCrDVVgw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fjlDbR43TNNYjWQPVrGM/w/Tk0YYn+OyUwkaDCjP1sbPYSj8obSGZ3KzK3e2BTzaOX7MO80L+RYf64H26Q0zrm5TQbkPzYL9eVzFOJ6K+Hrx9rnmQ7soGSGfvOhpAGlM0MH+U5s2Ysi0P63RshLeP7wO2urFnkjkYsAC+wYWZiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmP2KbP9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmP2KbP9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47118259fd8so26734515e9.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 05:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765718262; x=1766323062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpywd0ooBqabRS+5lH7EYtrqn3sd1kp/pArhDDLgKLk=;
        b=bmP2KbP9YnmWz3BjxXM3eNKldGSeJUVNjyBtbP0W3EQgtkeaKtCag2LY2PVPreZfj4
         vcVu2cN2GiaKWURJrLJc6KEdBQw8l1Gzlts/Lc9nXCjw1RDEo0Jb4S6Ex1lkbIf0TJ30
         LHBKWkdhxvmAlhYDy1YIy7ViSD2UT72byEcAsIhA1OqhrXADnf7457oZj+nbOGhsu/YI
         pBt5YPYQUehHrba5dQLWv6RvGTEqV9y6YsJEWtmPJKQNH4PX8IEVSl8WHQV8EHF46nD6
         peuJXObHgeB2/BWeb/zRAh6tOcjbdp50soFsPnoeh1kVZ+QsDw2xcJKKtnPEdDywitLy
         9PWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765718262; x=1766323062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mpywd0ooBqabRS+5lH7EYtrqn3sd1kp/pArhDDLgKLk=;
        b=fgpaaLyO72MOxLjWhTfp+Z1ubyrelewP84R2FqpCkH/mGx+PLbT73AyxY43UjoS62O
         ExNIexJVvGng0a1yPQ/3ccDWt+z4n0R+ddiUdMIYr4TOzYClj4IScQNOmj2hK15TkH8B
         +OejmiAApQrza7nHfQfETTBw0oj066FvA0R19ByescJLSINiLgddO/c1A5yUv6MG4GHR
         t9AbomU/a5Az5vp3Mt8Ja+VOsYOXgLkdk+HkQM6TE5N1uBZm6ZPUcbRwHB7CY/l6NhrI
         sIrHTo1xWCBvRqgLVrlC2etQUAfRQpXr5KWF6GHTZD4tCTLGF+6xfsXb4xsZfe7VW89+
         ae/g==
X-Forwarded-Encrypted: i=1; AJvYcCXX0DxPJwzNVz43evhe5xXheQ1xrJ1m4O67aONPDj7dzN5OfpZciQOn34jzz7+cE/B+1om67Zvd1cirRKgH@lists.linux.dev
X-Gm-Message-State: AOJu0YygV8EZKui3EZsol6KAzeHttrAu47yb5DnnU+SnDrD8fBHGF7/S
	4qanVtyAv7WW/PiULCKP7waMKw3kUURzojv+qzvoeNbaQ+jDjstBwMwr
X-Gm-Gg: AY/fxX7OGHjxYiOCSames/7JBMXZRhqPUD6s3o/CUP1+SSBjdblS7LWZK1y8KNemPgn
	uNjmyZ3R841rBuW2ixsHMmrGg/JA4XcW2wulH7ODE0ssUUzWXSPTLbxT83g4ibYPKnoYpSmZrXk
	cMdI+1/piRyR1+xyNvs5O4d1+ioxa1ytf02rNpQnFyTA/cp5hi+fY567hF6yKq0qVyOiuFuQnAX
	QG8Zmi3CpDf68VkG/cpJjWHqlfAL8PcCJbVvLVwLJLaZ7xRaQWWBafpzmZ+pBbBzTF6iNCjZnZV
	mNq6AWVWMqAxNY+JCKmozhkTVWTqvJ0OjxvUlRhLEIPQLOb6N2FQcHbIWNoSTbcolWIjVb/dPSP
	NgnB77fwC/rdR5G+IT3t9YApwzorfpCJvRB+M9G3ruE/dqHcbtI8g4V0YO5XK23cLpYGf+Y0XEu
	9cIgBbG1oszfymJ7GTO0Aj9qcEyQ6fNWnV5sZ5j6KSp7rElGgdM3+d
X-Google-Smtp-Source: AGHT+IHTX2KIoo6rHKnWJhWyrUXne9SI979vSJQ8O09DKd6yhp5jXCNNQXUTEJFhlKpFkjoCo3wQwg==
X-Received: by 2002:a05:600c:a009:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-47a8f8c4b8emr81227825e9.13.1765718262416;
        Sun, 14 Dec 2025 05:17:42 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4af065sm50301095e9.6.2025.12.14.05.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 05:17:42 -0800 (PST)
Date: Sun, 14 Dec 2025 13:17:40 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Crt Mori <cmo@melexis.com>, Richard Genoud
 <richard.genoud@bootlin.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Luo Jie <quic_luoj@quicinc.com>, Peter
 Zijlstra <peterz@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Andreas Noever
 <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 11/16] bitfield: Common up validation of the mask
 parameter
Message-ID: <20251214131740.40063fd7@pumpkin>
In-Reply-To: <202512141305.J3aPiiBv-lkp@intel.com>
References: <20251212193721.740055-12-david.laight.linux@gmail.com>
	<202512141305.J3aPiiBv-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 14 Dec 2025 14:19:30 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.19-rc1 next-20251212]
> [cannot apply to westeri-thunderbolt/next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/nfp-Call-FIELD_PREP-in-NFP_ETH_SET_BIT_CONFIG-wrapper/20251213-040625
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20251212193721.740055-12-david.laight.linux%40gmail.com
> patch subject: [PATCH v2 11/16] bitfield: Common up validation of the mask parameter
> config: i386-randconfig-053-20251213 (https://download.01.org/0day-ci/archive/20251214/202512141305.J3aPiiBv-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141305.J3aPiiBv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512141305.J3aPiiBv-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/gpu/drm/xe/xe_guc.c:639:19: error: converting the result of '<<' to a boolean always evaluates to true [-Werror,-Wtautological-constant-compare]  
>      639 |                 klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
>          |                                 ^
>    drivers/gpu/drm/xe/xe_guc_klv_helpers.h:62:2: note: expanded from macro 'PREP_GUC_KLV_TAG'
>       62 |         PREP_GUC_KLV_CONST(MAKE_GUC_KLV_KEY(TAG), MAKE_GUC_KLV_LEN(TAG))
>          |         ^
>    drivers/gpu/drm/xe/xe_guc_klv_helpers.h:38:20: note: expanded from macro 'PREP_GUC_KLV_CONST'
>       38 |         (FIELD_PREP_CONST(GUC_KLV_0_KEY, (key)) | \
>          |                           ^
>    drivers/gpu/drm/xe/abi/guc_klvs_abi.h:36:35: note: expanded from macro 'GUC_KLV_0_KEY'
>       36 | #define GUC_KLV_0_KEY                           (0xffffu << 16)
>          |                                                          ^

I've just sent a patch to move that warning to W=2.
It is picking up the same sort of things that -Wtype-limits does - already in W=2.

	David
