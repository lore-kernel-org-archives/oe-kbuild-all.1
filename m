Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95DE36C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 01:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743037999; cv=none; b=vApBR6dg1dYRbmQY4IVRkZSPP6AImbnShgqe+4ZV0mocybdajRCLVxNEk4kdlg1XLIw+fRDz/Gd16kHT2pz+vIr35vvqekyWTaW9/RgouLu2uoaiRPuOP9f5LDoaP0RU61AH+815Zl10ooMPH+lDR33YOTjLYfhKlfMy9qifUPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743037999; c=relaxed/simple;
	bh=m530oQpdK+bDzh/ln85B/YYzFNCIGLD/ipYtrFtyaAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7esJJR5bJ+26yVOtHKzRgfztaD2ch/MY1/7I6lmoZpL5lJtayhew35U2XrpLu3b44s/+gfdm4MRvYoN9gvPA7UGztJX7MVqHx+UKDm7YVFDY+znGlVRVum77qobCQTausd+WZJnQ245OIT0TDkzUEEL4B4O4NoSjvqc+ePIuBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyNUvmIr; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyNUvmIr"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so86129266b.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 18:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743037994; x=1743642794; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hoHDC3JtUoSlWeOOdPxQY/Nm0XTielw+uZpYtN2LZI=;
        b=lyNUvmIrlGB1u5izZaKa0p6zA/yN7vj0VpBBKVyoJ/fG0asfYMe3zFTW3oqGdsbagv
         YyX4hZlQCFd7cf14CErUHL4QcjHSSbAgG6Pyzh1Mn5VD8NT4mL2FAnhtdxeCjLP8r/HH
         c+YNc/vsNfCGqJ5FVR0taxNKenaFtI10jN2SM8e+5NUSpJlWg7ZF7ocbicbP25ghdetv
         rJM1ecysQonvSRyeUD7/W8T62SW6PnnxbomVVDdwqVivWTmxgqeLRh6qnUvf1FXlbVX/
         +U5xV3wExVPIvAl2orszL2xBl5cl7rN6fsyQnDhq4O6YXdQQwx0UTsf++RcyrqtYrwf6
         5NFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743037994; x=1743642794;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7hoHDC3JtUoSlWeOOdPxQY/Nm0XTielw+uZpYtN2LZI=;
        b=mXCk9wBhoTx/kGQ2IN2l2heM5iC2PUSkL7Mc8EXLFPRzjfDcR9lGV4NsTk6OFW+DU6
         /kTzxPO0qjQCIp5pAwrB8RfTuxlMV1bNGQmyruACcamq32a9Ts35MLW/2rahIBLddiul
         Iw5r7c6XljbnYRfFdIutcPsZbj2axKDZslrptltMu/7jzmbB1v4b062lT9dLNzHnUada
         eSMK93uY8PmIO0kPgafg1Qhy8Xd9LKlNnmNrepT4BX8aQS/bHhGlcybKDXMbNajCT+On
         jf/gyWniAYgCSTEwZ5GuawAOvJgGCs7fqx5N+4kA6j6FtYUb7qL89lROudLkRkggnvsS
         XXKA==
X-Forwarded-Encrypted: i=1; AJvYcCXIFKM30/gbdwxr2602dT0+nM1TAL/yYp6AuzJpc+59B0sWqpbGTOv29tUhEEYxMkq+ezWmvk21zn+OV7zs@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+Ng7SKuUISsYBCCSpuWNsTDbkEcCeMplihQYPNdNT1vFnHxWk
	YJ1W8UM3/sX5z6EEOMVXOu+F8Q56KP7UKR97cTiWR8IQGkv2pD9D8M9vuGgd
X-Gm-Gg: ASbGnctJS3a8m7TxSlhEo3rPE82BJg2QvwcpVmhRPTpiy2Q7SfKji5Ggsug+4sLr5hj
	SoQACkrKHg9i0+Wb43UKF975AVrRLqSSeudLfpIluLL5TkJi5W95DNkPVvok/vjCEPWVZKZGGBd
	r8QdLHgyqGTGKFbvh0+4IhazGiTNXltlnMUB2Y5DaSQsHCJT632LO6lMjIMVq9Bky5/ysVkIy/R
	S0Q5jZoQ6PHOFr7irtLqV0PAIhArFhFXJ+UDpzm+shZA3Qx3iLTrAv+EspaQRsZ1tYhGWE2CnNi
	z7+7KLdMycIuf1sZlegGETlvVYbgUIWnnbU0hpy4jnX3
X-Google-Smtp-Source: AGHT+IHhYdoOv0p7TAjQ0P+GnyHxjE4+7fAF+A6cPdm2gu2day/h3UwvP9oAultJ7bFRvfWvrlTDEg==
X-Received: by 2002:a17:907:9446:b0:ab7:9df1:e562 with SMTP id a640c23a62f3a-ac6fb1444e7mr120774466b.48.1743037993691;
        Wed, 26 Mar 2025 18:13:13 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efd78e0csm1133142966b.175.2025.03.26.18.13.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Mar 2025 18:13:13 -0700 (PDT)
Date: Thu, 27 Mar 2025 01:13:12 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Wei Yang <richard.weiyang@gmail.com>
Subject: Re: WARNING: modpost: vmlinux: section mismatch in reference:
 mm_cmdline_setup+0x94 (section: .text.unlikely) -> memblock (section:
 .init.data)
Message-ID: <20250327011312.mj55byrfatiprddh@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <202503241259.kJV3U7Xj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503241259.kJV3U7Xj-lkp@intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Mon, Mar 24, 2025 at 12:59:00PM +0800, kernel test robot wrote:
>tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>head:   586de92313fcab8ed84ac5f78f4d2aae2db92c59
>commit: 73db3abdca58c8a014ec4c88cf5ef925cbf63669 init/modpost: conditionally check section mismatch to __meminit*

Looks this is not the cause, after reverting this commit it still report
mismatch.

>date:   8 months ago
>config: microblaze-randconfig-r061-20250323 (https://download.01.org/0day-ci/archive/20250324/202503241259.kJV3U7Xj-lkp@intel.com/config)
>compiler: microblaze-linux-gcc (GCC) 10.5.0
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250324/202503241259.kJV3U7Xj-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202503241259.kJV3U7Xj-lkp@intel.com/
>
>All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
>>> WARNING: modpost: vmlinux: section mismatch in reference: mm_cmdline_setup+0x94 (section: .text.unlikely) -> memblock (section: .init.data)

The reason for this is gcc put mm_cmdline_setup into .text.unlikely section.
Since it is only used by mmu_init() which is annotated by __init, I think the
proper way is to add __init to mm_cmdline_setup.


diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
index 4520c5741579..e98cfaf1c62b 100644
--- a/arch/microblaze/mm/init.c
+++ b/arch/microblaze/mm/init.c
@@ -143,7 +143,7 @@ int page_is_ram(unsigned long pfn)
 /*
  * Check for command-line options that affect what MMU_init will do.
  */
-static void mm_cmdline_setup(void)
+static void __init mm_cmdline_setup(void)
 {
 	unsigned long maxmem = 0;
 	char *p = cmd_line;


-- 
Wei Yang
Help you, Help me
