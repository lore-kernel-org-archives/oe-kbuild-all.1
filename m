Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D148C1E25FC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 10:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730973613; cv=none; b=ltrpLp2VYgWRejffuuEFKbCs2fqEbvmpZS5pOCl3aBXaZ0eosL91U3hdIod/y0CnouibjNPZ7x/wgSjtjn5xzVAWTU7dbEOkYNCbpRNSgWU+Kwaq2DM2JkrgdyCNu+n4aMzh0bAzNgmoY+tYQ2d0ZlADQGeHDaQra0roBYS6OiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730973613; c=relaxed/simple;
	bh=w9yI8lWXWYKS//5S8rVBTnTahtybC6u2bvZuwZ4cXtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vEmjGb88ZYI4vqxOH9AMXTbumFh2TVb40qz2N7VoBXRKdXAJUeSqHKCkB4Ix9hAqK1cnu7VYgigrVTskbib1COHq8e9N9hTXQLAoG7uvPOT35DPjT1b8AIZAusy7OkAeLnazc+i6ohY3pmuWH5Ecd2PwhTzHFThcw0qdNuNpPGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PYpD55+E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PYpD55+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730973610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSaL6eKuRvPmrX5tsUmI1Nb/IcbFfZ6b/DI5ir3s7lA=;
	b=PYpD55+E1XQbApm9C1k5mRjfyK3/8fASBTg0dcbood6ikhTgAVPHxZSbs9UrJ4tTPo9uWX
	cVpamKSjtevvKktN/vrIM4k4PVeamUl4d0kBpdM0gyF4dg/CCuMY1YkzAwONK5CiRnA3yy
	PyQhzm1sIgqMalgYPTGWK95ZQC0nVGc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-MWr7tpuzO-2sIlPpY9Ozbg-1; Thu, 07 Nov 2024 05:00:09 -0500
X-MC-Unique: MWr7tpuzO-2sIlPpY9Ozbg-1
X-Mimecast-MFC-AGG-ID: MWr7tpuzO-2sIlPpY9Ozbg
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a9a23eada74so52811666b.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 07 Nov 2024 02:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730973608; x=1731578408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xSaL6eKuRvPmrX5tsUmI1Nb/IcbFfZ6b/DI5ir3s7lA=;
        b=vOwGy4jDQQ6v4ZUq7YPSVBvtHCVDCaAFsxwHjrjKxTctLNh3WRLe9sHAcCOlno7RZO
         j8tB1CTvIeT219EK8bMKn07rkwjY0KXb1phEbo0FVcr5WUCXFLM3yvohv8at9BTpE1xR
         YTEoRqqpI+fFBjz+wOXNsJ/Di0PV9GzzST0VR6SudNf68oJEf/tH93tgLEX/+Twm3+k2
         7FaQCkZgvqSXvSfTCAV4JPNBwIYNWeAoDypdNQS5Fit+qBbFmxsz6Xe4URVXWRakjT6C
         tKNJ3QUNE+CNXXGflerS1GCipSStrtye4B+9kgkGZrGQxNoA8tjSoSBXQpBZOGA8HVao
         XMKQ==
X-Gm-Message-State: AOJu0YxJ0Tis6cdOMG/xJytnk/1Ozi5e4ELj9+kJMvm2lLor+2Wvg9xT
	YFspnbknInKVVxQjMlyfUGXNGF83YR0pHqN7jPq9ThcAHzNak1uLWQ1fz/mqEkL1++wO3JHDNR6
	dVD0J78sxYeSf2RhaaK7fSy+GaBJ2JEdEn1+cmnmBJdFkuSQ7yAFLPkCXMLRiMw0=
X-Received: by 2002:a17:907:60d5:b0:a9a:dc3:c86e with SMTP id a640c23a62f3a-a9ee7479e03mr35191666b.11.1730973608117;
        Thu, 07 Nov 2024 02:00:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/f44ihLzRRjhrR6wtZZtX0PnETfql+43291z1n6HS4MEmsSonliqluQo9OpKMFKiervRIqg==
X-Received: by 2002:a17:907:60d5:b0:a9a:dc3:c86e with SMTP id a640c23a62f3a-a9ee7479e03mr35188666b.11.1730973607713;
        Thu, 07 Nov 2024 02:00:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc4c55sm70020166b.130.2024.11.07.02.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 02:00:07 -0800 (PST)
Message-ID: <6695bf6f-ad13-4106-8530-2f0608fb94a2@redhat.com>
Date: Thu, 7 Nov 2024 11:00:06 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-pci: Add DMI quirk for missing CD GPIO on
 Vexia Edu Atla 10 tablet
To: kernel test robot <lkp@intel.com>, Adrian Hunter
 <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-mmc@vger.kernel.org
References: <20241106215927.40482-1-hdegoede@redhat.com>
 <202411071730.x3HIZimE-lkp@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202411071730.x3HIZimE-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: swC9yrKlhXvh2m4KL4w6qUtbslVNqXwdc06aAS_ptMs_1730973608
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7-Nov-24 10:35 AM, kernel test robot wrote:
> Hi Hans,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on ulf-hansson-mmc-mirror/next]
> [also build test WARNING on linus/master v6.12-rc6 next-20241106]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/mmc-sdhci-pci-Add-DMI-quirk-for-missing-CD-GPIO-on-Vexia-Edu-Atla-10-tablet/20241107-060048
> base:   https://git.linaro.org/people/ulf.hansson/mmc-mirror.git next
> patch link:    https://lore.kernel.org/r/20241106215927.40482-1-hdegoede%40redhat.com
> patch subject: [PATCH] mmc: sdhci-pci: Add DMI quirk for missing CD GPIO on Vexia Edu Atla 10 tablet
> config: i386-randconfig-061-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071730.x3HIZimE-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071730.x3HIZimE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411071730.x3HIZimE-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>>> drivers/mmc/host/sdhci-pci-core.c:2068:28: sparse: sparse: symbol 'sdhci_pci_dmi_cd_gpio_overrides' was not declared. Should it be static?

Yes it should I'll send a v2 of the patch fixing this.

Regards,

Hans


