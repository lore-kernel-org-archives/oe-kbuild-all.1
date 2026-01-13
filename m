Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FFE36E468
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 20:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768334702; cv=none; b=Jzx71Rovt7iQ1qknWeV4bTuBkXdu/JoNMvlCoDy3Z1Cux6b0v/I8UfJ2y/h49776XKXWIQq9yZcMLwXSpBeA5AKkodjxwB05R19UvTaQq52EVRZmNLkUcOC90ZneoWblUqt4nVmxZ1qKRTtib8b5ZvKLq1Ovb2U8m/nb/7uNKm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768334702; c=relaxed/simple;
	bh=BOlPQfIkt/fjEJvpKRaH6vV9rI3DP+2Yxs4j/ADRLvc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uw+IqVxslqS2KkxEDj+tLGkVBzD3ipjz6RzchqpXRBPXRDrUkHX6Bj6GG7SjG5bPL4/i8IVuUkqn6fuWt6k30H/RSTq3j4YIpO4oUxFUFYhPtbFDv/AGYSztNSPOpJLihx8F0k8W77vq9aEF0nruFlwjf2jmIQEVES/zZiPpU6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCcF5UVh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCcF5UVh"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so59511805e9.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 12:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768334698; x=1768939498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0muJ4312EJ6gGXEPQdwyzyI8xQcdUomK1P5HrD6iP7k=;
        b=fCcF5UVhLe3GJt56nfNZauUiMd4Bn0cG63KW5wG4uQtA7K9gm4gx8N21l7CvGT23ch
         R6qju+SkeknL1m1KBGtShi61V+X2ZWYLWEUsuvshhoVrabh1LbH0Cjpoh6fj/K2h/5M/
         IbYlQw+3iD379SgrH4Mz1bIYp+ngzM8s6vDsizpQYWdYJmSvWq7U/Hl9A5fHOMWrcVQA
         a9RCOQgwxQFmaoudyYXraxLEjXJE2rDSa89I58Vbv8bDZRQYDZj6D5FUUQOeHw8s8032
         tNL8pU+zLdpj8zsLhOhs3cLSO+8r4NZOGx1ITTciQqEqr7Njwy7dHUfzJqmMj8PyRy7X
         gRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768334698; x=1768939498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0muJ4312EJ6gGXEPQdwyzyI8xQcdUomK1P5HrD6iP7k=;
        b=vApfIFivuoBK5quRRf9nVOdqmodzn5ie6WwJDiaSPHbohCix9sYvVk+36QdmU7RcXk
         LMAs7nHTx9IARA0YWk73DRaLSxxEQdcFWZ9e3NK8blgbTvhSd7lfQbz0WptrM+faNw5V
         84qU7jO4FAMqtW99MSHrlRz4vNpOhDDHlvmImKXOu1ybP1k8CuENBhWL5RdEBCVonfEk
         YcNSRp27nocFiPyVMskoDnVdw75tnbqtHc5SU8GNu01wC9++5psIUG5CZQe/ZCrv0Bbc
         18lwOi3tIXAlSdgh37/E0vTMs9kNznvTzfeQHDDHdQrONFzRW0r/KXi5k8Zfd+SwA4yO
         bfdw==
X-Gm-Message-State: AOJu0Yz5uSSPozMFAS/U/4kgv4cwOdwF39m1jXKQlJ2mHYVMmOM8ZMGb
	h7w64UtsT3j44b81D/U5CDKuHhn2Ba2TVRQhTaBXk4D702DB9UNN1a2i
X-Gm-Gg: AY/fxX4pTLiFTH3vPhtkSE74YE2zaLoJ+a8qDmvsAUkp9VTTtiexyS36CWAduQLQl+W
	YPnwA/JRwzly3Tn4NI/CG1EyCuAPlYSbCrTEuxYbZyoedIAr0ojMEKuzp8qzcQGAN2oQ1t0Qy2z
	FyHkw0EdTIM/hZm7qyVsAr55nsaHDlVAxE6+Eksq5T6g3i55qVmQ+i/i5HI1c2+P8WJPlqTJ28k
	yLP2QnT23PxLSWbHvJmXzvym69H048cq7e2wyLMVz7Aeb1WOr+iEoaz9MlqfsudKcCFeI9EZL0y
	bfzzKtsHdSNaHExkJpmP/0JQOYfAJoZpCO/RihKMLb2Bg0HfuG1T0e1giDmXLshDqEzDGIIOola
	W3riBD6JglDhGB0R9V6LqcQKPzkPoGCNHAgbOSFlT9EmLR8Y4Iwphws5PnnXo2E6prf9joLjkFz
	xUartWnKNtmAweL3PG2m5Tpj38IfQQrGpK+K+S8X5WYAcp+GCNRhgBtk5mwShe9og=
X-Received: by 2002:a05:600c:4443:b0:477:9392:8557 with SMTP id 5b1f17b1804b1-47ee338d53fmr4231585e9.18.1768334698044;
        Tue, 13 Jan 2026 12:04:58 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0daa78sm46840666f8f.6.2026.01.13.12.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 12:04:57 -0800 (PST)
Date: Tue, 13 Jan 2026 20:04:55 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Andrew
 Morton <akpm@linux-foundation.org>, Linux Memory Management List
 <linux-mm@kvack.org>, Nicolas Pitre <npitre@baylibre.com>,
 linux-mips@vger.kernel.org, tsbogend@alpha.franked.de
Subject: Re: mips64-linux-ld: div64.c:undefined reference to `__multi3'
Message-ID: <20260113200455.3dffe121@pumpkin>
In-Reply-To: <202601140146.hMLODc6v-lkp@intel.com>
References: <202601140146.hMLODc6v-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Jan 2026 01:59:24 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   b71e635feefc852405b14620a7fc58c4c80c0f73
> commit: d10bb374c41e4c4dced04ae7d2fe2d782a5858a0 lib: mul_u64_u64_div_u64(): optimise the divide code
> date:   8 weeks ago
> config: mips-randconfig-r113-20260113 (https://download.01.org/0day-ci/archive/20260114/202601140146.hMLODc6v-lkp@intel.com/config)
> compiler: mips64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140146.hMLODc6v-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601140146.hMLODc6v-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mips64-linux-ld: lib/math/div64.o: in function `mul_u64_add_u64_div_u64':
>    div64.c:(.text+0x84): undefined reference to `__multi3'
> >> mips64-linux-ld: div64.c:(.text+0x11c): undefined reference to `__multi3'  
> 

This looks like a bug in the mips 'port'.
arch/mips/lib/multi3.c has the comment:

/*
 * GCC 7 & older can suboptimally generate __multi3 calls for mips64r6, so for
 * that specific case only we implement that intrinsic here.
 *
 * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82981
 */
#if defined(CONFIG_64BIT) && defined(CONFIG_CPU_MIPSR6) && (__GNUC__ < 8)

So this code is excluded for gcc 8.5 but the compiler is generating the call.

Looking at the git log for that file there is a comment that includes:
	"we wouldn't expect any calls to __multi3 to be generated from
	 kernel code".
Not true....
Not sure why the link didn't fail before though, something subtle must
have changed.

I think the fix is just to remove the gcc version check.
The code itself just adds the results of four multiply instructions together.

	David
