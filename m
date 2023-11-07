Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D8030CE5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 13:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zg5e5TlV"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-581de3e691dso2872784eaf.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Nov 2023 05:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699363344; x=1699968144; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VY4YJsEGOak3+/jF/9NUyuTCsmVfDICPRDm+qZKQykI=;
        b=Zg5e5TlVdnhz44CnikrLTPvYR5TIzyyft4xlChJ7rM+5X9aO37i4AjkQ/HJ3o8Tx5R
         IP1SlcHJAS48UejGy1T6y9yOgWtNVegFkFVpf1bQCWgS1fPyhl0SOxRDjjoDqbX8i/c3
         229BbqR5Cm3e3Hw5iw/FvUGAP0B4GHBe7P6NU3JvX52hXuPzVH7CpqOp8R4LUEfSaA34
         NT81/75DsWEuRCyOsy6wnKZT9lz/5xtALBGTTwCO0DJfhhDdFpd+avlEHBhlHomLEuhb
         SkGJD6QoBSAzZjsZyGihAMwyXVSf5AkyoYx09k0+MBHN6A2PjhStOIX3+bv85aTYlp40
         GrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699363344; x=1699968144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VY4YJsEGOak3+/jF/9NUyuTCsmVfDICPRDm+qZKQykI=;
        b=kJiHI/X8vH5zT6w1PTVYGTnpnuxaF11eDcvf79R/jOrecN6jhWvpKA0mQ13eN5C+cj
         bDD/G268NdJ68rC4bcvd0z0KRHis9pYqAn42rv2smRmpX7tO0t7hSpkwE4R+f9c2J645
         +wJXNYdbOT6xhOW8o7iR8b7hq9WjvcHk+MWsPu/aVsFU7b7YIeuAjuweOJN1IrELzulg
         85BCzpQ3Zn4FBQ+aFmZ9/GkaLQMbQk7vJVZX62r8hIASnT0UEpDNIkbVnPD5Ntsamm79
         kL2JTAGcla6Ryh+/CDBDC/toTk6gYa/Ui5ccPsDJIUffJ3p/c5aiuXxCIuXtDYPK7nbg
         gSYQ==
X-Gm-Message-State: AOJu0YxRqPW4g7dkuEgd9g3nOENh0wucATZNnc3pwTovjMcUktoUnNlD
	fxxiW1wOXTosIqGpOf3u2AZIb7zm6p+xUA==
X-Google-Smtp-Source: AGHT+IFT7Oy9WktgHsiKgbgYbIMS3nEk8quzxpemI7iwlASDHcKTkrP6mUS9D/07NTWddfCN0l1X7Q==
X-Received: by 2002:a05:6358:918e:b0:16b:55bf:9ab0 with SMTP id j14-20020a056358918e00b0016b55bf9ab0mr11992003rwa.8.1699363343685;
        Tue, 07 Nov 2023 05:22:23 -0800 (PST)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id x8-20020a631708000000b00578afd8e012sm1353304pgl.92.2023.11.07.05.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 05:22:23 -0800 (PST)
Date: Tue, 7 Nov 2023 05:22:20 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Syed Nayyar Waris <syednwaris@gmail.com>,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alobakin:pfcp 11/19] include/linux/bitmap.h:642:17: warning:
 array subscript [1, 1024] is outside array bounds of 'long unsigned int[1]'
Message-ID: <ZUo6DLwy5FoDkZlX@yury-ThinkPad>
References: <202310170708.fJzLlgDM-lkp@intel.com>
 <bd7fe929-c6fc-42be-9d2f-3f53ec21fd10@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd7fe929-c6fc-42be-9d2f-3f53ec21fd10@intel.com>

On Mon, Nov 06, 2023 at 05:31:34PM +0100, Alexander Lobakin wrote:
> BTW, I have this in my inbox:
> 
> From: Kernel Test Robot <lkp@intel.com>
> Date: Tue, 17 Oct 2023 08:14:51 +0800
> 
> > tree:   https://github.com/alobakin/linux pfcp
> > head:   9183a3eb639912169a3d3e2be4f25556b465919b
> > commit: c8a652cdcc0964510f108726b3da0784d1bc0cd2 [11/19] bitmap: make bitmap_{get,set}_value8() use bitmap_{read,write}()
> 
> So it happened after I converted bitmap_{get,set}_value8() so that they
> use bitmap_{read,write}().
> 
> > config: x86_64-randconfig-004-20231017 (https://download.01.org/0day-ci/archive/20231017/202310170708.fJzLlgDM-lkp@intel.com/config)
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310170708.fJzLlgDM-lkp@intel.com/reproduce)

[...]
 
> >      643 |  map[index + 1] |= (value >> space);
> >          |                 ^~
> >    In file included from include/linux/kasan-checks.h:5,
> >                     from include/asm-generic/rwonce.h:26,
> >                     from ./arch/x86/include/generated/asm/rwonce.h:1,
> >                     from include/linux/compiler.h:246,
> >                     from include/linux/build_bug.h:5,
> >                     from include/linux/bits.h:21,
> >                     from include/linux/ioport.h:13,
> >                     from include/linux/acpi.h:12,
> >                     from drivers/gpio/gpio-pca953x.c:11:
> >    drivers/gpio/gpio-pca953x.c:1032:17: note: while referencing 'val'

It looks like a gcc-9 false-positive. I tried gcc-12 and gcc-13, and
they both looks OK. Below is the fix that works for me.

Can you please test the following patch and add it to your series?

Thanks,
        Yury

From 2a883221ddbd18796ddef0125e9e3022a56edd7b Mon Sep 17 00:00:00 2001
From: Yury Norov <yury.norov@gmail.com>
Date: Tue, 7 Nov 2023 05:05:17 -0800
Subject: [PATCH] bitmap: suppress false-positive -Warray-bounds in
 bitmap_{read,write}

bitmap_{read,write} conditionally accesses map[index + 1], carefully
checking before that it's a safe dereference. But still, gcc-9 emits
-Warray-bounds.

Gcc-12 and gcc-13 are both OK with this code. So fix it for gcc-9 with
OPTIMIZER_HIDE_VAR().

Reported-by: Alexander Lobakin <aleksander.lobakin@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310170708.fJzLlgDM-lkp@intel.com/
Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/bitmap.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 945a680816cc..0b1a07ff1080 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -592,6 +592,11 @@ static inline unsigned long bitmap_read(const unsigned long *map,
 	if (unlikely(!nbits || nbits > BITS_PER_LONG))
 		return 0;
 
+#if CONFIG_GCC_VERSION < 100000
+	/* Suppress gcc-9 false-positive -Warray-bounds */
+	OPTIMIZER_HIDE_VAR(map);
+#endif
+
 	if (space >= nbits)
 		return (map[index] >> offset) & BITMAP_LAST_WORD_MASK(nbits);
 
@@ -634,6 +639,11 @@ static inline void bitmap_write(unsigned long *map, unsigned long value,
 	fit = space >= nbits;
 	index = BIT_WORD(start);
 
+#if CONFIG_GCC_VERSION < 100000
+	/* Suppress gcc-9 false-positive -Warray-bounds */
+	OPTIMIZER_HIDE_VAR(map);
+#endif
+
 	map[index] &= (fit ? (~(mask << offset)) : ~BITMAP_FIRST_WORD_MASK(start));
 	map[index] |= value << offset;
 	if (fit)
-- 
2.39.2

