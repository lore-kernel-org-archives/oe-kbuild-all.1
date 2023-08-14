Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D7CCA4B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 19:54:41 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1765040E0196;
	Mon, 14 Aug 2023 19:54:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id K110PFzaRqoL; Mon, 14 Aug 2023 19:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1692042870; bh=8X5ow2G4Q+5+Ob4SO19VCRpYYOIz9IdhDHUPDB2ajLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hJrYSYrbNxzELOqrt8a6mqhgkIJRbFusJSg9celVB40aYAvjNeJh80V38YowWSVIH
	 DwMKrbDYmSebbaoGvsvAIVxJ8AbGLhNuX2xYCIjoRqaIo1zZ5lJ92FErSZVr+pztzN
	 ZdW+2EloEYzW/WZyEKjqKEdJ9MuxxBfU/RXdmCkYxkcMcpxzEf6C7vMHGGJW6jRkj3
	 TZ/0sejYeo4AuyCZlQZtDwN4tCKM00VN1eLzJ5sdQgZQo24j0Oqqno0FQqkceUcZoa
	 j2oplJDqehv5X0UAguJNiMdVyZGLIi8cJ4E8wL02i6sA2vEk1dZMjoXg2oz1P7QK64
	 Dv8WtfY9yTAhfl2DkwyYco/21fAvh4xkGm+eBkQ+Z8qgV1UjsoF1szyynKfz+oQf+/
	 oIsIuJyq4s15KmDM65EgIoxVO/P+7S4s60sl7njvYl/0Z3qU65hqJUjefsEYhyMCw1
	 5VcXReJGciM8vrwZBpKz7/v+rDb6Dl+T/kb0uMSa56nHROnzaPWwjSICKI0w8kAvhw
	 s3JW58XhcmJDssojnSJI5aVSEyPnLNclzf4bAxcSTU97B7oFL3pHDdX2TkvEd0LVey
	 ZU+TEeg/Brnr5mIqrwshWAWZa66/XLyHrGMijLNoevyPCm2llfRaKCbmxoicurcD7b
	 FodQN8keLQMcEHOePrczT0bw=
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D3BB940E0185;
	Mon, 14 Aug 2023 19:54:26 +0000 (UTC)
Date: Mon, 14 Aug 2023 21:54:20 +0200
From: Borislav Petkov <bp@alien8.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [tip:master 20/20] arch/x86/include/asm/microcode.h:29:20:
 error: redefinition of 'amd_check_microcode'
Message-ID: <20230814195420.GHZNqGbA54XsfLkvDG@fat_crate.local>
References: <202308150231.ThoHOoid-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202308150231.ThoHOoid-lkp@intel.com>

On Tue, Aug 15, 2023 at 02:51:42AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
> head:   d2915b8e76b3a598febd7348799d745cb741a2f5
> commit: d2915b8e76b3a598febd7348799d745cb741a2f5 [20/20] Merge x86/microcode into tip/master
> config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230815/202308150231.ThoHOoid-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150231.ThoHOoid-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308150231.ThoHOoid-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/x86/kernel/smpboot.c:80:
> >> arch/x86/include/asm/microcode.h:29:20: error: redefinition of 'amd_check_microcode'
>       29 | static inline void amd_check_microcode(void) {}

Thanks for reporting. That was a mismerge on my part, sorry about that.

Fixed now.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
