Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22948C0F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 19:12:43 +0000 (UTC)
Received: from zn.tnic (p5de8e8ea.dip0.t-ipconnect.de [93.232.232.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 56B351EC068F;
	Wed, 10 May 2023 21:12:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1683745955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O14v+FKAaw2NYhPpr6up98kV+lFwniQZV5rBsLPN0xY=;
	b=HYaQAUHljzUijkUfH5iFt4COrusl/nXDV8UpuN8jt0Adu27ECcPLv+x3u3r7NZgKSQ3sgL
	9gJ0Vkjg0nIIVW0FyLNhtYyVahC5ns3KH6sgj5ysDK+B+zGJvnQqek31pKzz7h/H8L3Kgt
	TQku0csN45S/S5alJGe7/dxiKq94EQw=
Date: Wed, 10 May 2023 21:12:30 +0200
From: Borislav Petkov <bp@alien8.de>
To: kernel test robot <lkp@intel.com>
Cc: Juergen Gross <jgross@suse.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [bp:rc1-mtrr 2/16] ./usr/include/asm/mtrr.h:88:9: error: unknown
 type name 'bool'
Message-ID: <20230510191230.GEZFvsnsMTS/iIEZmV@fat_crate.local>
References: <202305110003.WD5XnBVn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202305110003.WD5XnBVn-lkp@intel.com>

On Thu, May 11, 2023 at 01:00:29AM +0800, kernel test robot wrote:
> All errors (new ones prefixed by >>):
> 
>    In file included from <command-line>:
> >> ./usr/include/asm/mtrr.h:88:9: error: unknown type name 'bool'
>       88 |         bool have_fixed;
>          |         ^~~~
> 

I was wondering how TF it doesn't know bool.

BUT, you've missed one important line from the build log which is
the preceding one:

  HDRTEST usr/include/asm/mtrr.h
  ^^^^^^^^^^
In file included from <command-line>:
./usr/include/asm/mtrr.h:88:9: error: unknown type name ‘bool’
   88 |         bool have_fixed;
      |         ^~~~

that's the header test gunk which does:

gcc-11 -std=c90 -Wall -Werror=implicit-function-declaration -m64 -Wp,-MMD,usr/include/asm/.mtrr.hdrtest.d -I usr/include -I ./usr/dummy-include -fsyntax-only -x c /dev/null  -include usr/include/asm/mtrr.h -include usr/include/asm/mtrr.h
In file included from <command-line>:
./usr/include/asm/mtrr.h:88:9: error: unknown type name ‘bool’
   88 |         bool have_fixed;
      |

And, ofc, struct mtrr_state_type has no place in the uapi header:

---
diff --git a/arch/x86/include/asm/mtrr.h b/arch/x86/include/asm/mtrr.h
index 2185a292a50f..090d658a85a6 100644
--- a/arch/x86/include/asm/mtrr.h
+++ b/arch/x86/include/asm/mtrr.h
@@ -44,6 +44,14 @@
 #define MTRR_PHYSMASK_RSVD	GENMASK(10, 0)
 #define MTRR_PHYSMASK_V		BIT_MASK(11)
 
+struct mtrr_state_type {
+	struct mtrr_var_range var_ranges[MTRR_MAX_VAR_RANGES];
+	mtrr_type fixed_ranges[MTRR_NUM_FIXED_RANGES];
+	unsigned char enabled;
+	bool have_fixed;
+	mtrr_type def_type;
+};
+
 /*
  * The following functions are for use by other drivers that cannot use
  * arch_phys_wc_add and arch_phys_wc_del.
diff --git a/arch/x86/include/uapi/asm/mtrr.h b/arch/x86/include/uapi/asm/mtrr.h
index f476a1355182..3a8a8eb8ac3a 100644
--- a/arch/x86/include/uapi/asm/mtrr.h
+++ b/arch/x86/include/uapi/asm/mtrr.h
@@ -81,14 +81,6 @@ typedef __u8 mtrr_type;
 #define MTRR_NUM_FIXED_RANGES 88
 #define MTRR_MAX_VAR_RANGES 256
 
-struct mtrr_state_type {
-	struct mtrr_var_range var_ranges[MTRR_MAX_VAR_RANGES];
-	mtrr_type fixed_ranges[MTRR_NUM_FIXED_RANGES];
-	unsigned char enabled;
-	bool have_fixed;
-	mtrr_type def_type;
-};
-
 #define MTRRphysBase_MSR(reg) (0x200 + 2 * (reg))
 #define MTRRphysMask_MSR(reg) (0x200 + 2 * (reg) + 1)

---

Thx. 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
