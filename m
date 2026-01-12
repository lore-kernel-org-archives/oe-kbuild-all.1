Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D5A356A17
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 11:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768218134; cv=none; b=Io2OSfuD8O0998lgGblMPB29iggmei1NTXEL4sfc8lbZQch/XFGsxFka2M2V6XpWMTg9lbTtnikGC9pw+KD50DvOYEaWIu8ZIUEjc4DYBntfGSn+bQ9DS/IXnCKjaeKkpobrfotJTBeZmsSuNtEqopvMjnBV7eu2+Z1I43GM6vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768218134; c=relaxed/simple;
	bh=qV38485eFjtXicxLbcdFdL38T91/kNlqZHvKkOIDLrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhoR3/hm1X5Qe09dvkFSNAIi5c8rqDo86Su0WgjHzasHkWk1/RjULLdEMAYjRKtNgvF91FmLcSu41JZ2uq+4y9qx7yO3zd2Rr7302hlr3tf8iJkwOaT1Mtbcm41Tm8O+SI+4s2dNRPncotkHSWWnCdwrl5PnWjbwXc3kijnHrbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=igOm6keo; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="igOm6keo"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9BEBB40E0200;
	Mon, 12 Jan 2026 11:42:03 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id M2NIEAYk2y8N; Mon, 12 Jan 2026 11:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1768218118; bh=+I0tYpjvNjvhnMOcKvSWO6I5VWb31eWSH/dU9boIYTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=igOm6keov7Q5B0kjb1gCaQPfBqGhRtMERRRE3ScKPjGM58eN8IedMeBbOIR8+wz3+
	 Mp/o1zdTNn5XZL//WEmRqwBVW8y+qtx0gJzWqfnAZlnEcfo/1X8NhshZCCReouF3Kx
	 /XM684KnY18PNJp1Rf+yz6CmD0/IOv0MwhFXQuFJztUNw+S0WTWNLCwAcpuU0ymzbi
	 oCQOOsf3LuuGp3LQxSggGMr5vqrHxqm9Pq2UUaOe5O9twxcTo6f0n+bNWx49VITPcl
	 p0OvZYi/5o2ZFgZq0xZ/K4pgtAh42WuYELipXduHcAr0YA6rpC21z+wrWr37+WFLEx
	 7+2hRBzdLs9jla9SEuYvW7DPMqE1ASKoXcpNoyRYN7hQlHPJPFM7l+86L/RiZGi6NC
	 gEFXhzvj8SBYmUgNfSqwVnIPJ+oF3iHgpdU7vWHVqmn6BwlX0OyoSxF5cgLcQ3P6B8
	 Xq/XADq8h9IRvfUNDvBQTh544iVDLrqqDWBMKO7TH4BHRLw8h/C9yGTVP/PuHK488q
	 VnVLf8ERSXZ4HcFCA6Acb1Dhoolt6v3j+EkQZqFpgrpK5iiDfJW55QB3S66Ufzic9f
	 gmN5IBEs/LUj/Z5S0HNAwSh1WDoBsAJLUhVTRkjOZM5GwgXWBqQVXRAXALbPp1mngH
	 XLkRc4lL2VpnJA7+OO3BlNm4=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 5A89640E0194;
	Mon, 12 Jan 2026 11:41:53 +0000 (UTC)
Date: Mon, 12 Jan 2026 12:41:47 +0100
From: Borislav Petkov <bp@alien8.de>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Nikunj A Dadhania <nikunj@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: [PATCH] x86/sev: Use kfree_sensitive() when freeing a SNP message
 descriptor
Message-ID: <20260112114147.GBaWTd-8HSy_Xp4S3X@fat_crate.local>
References: <a9b57156-4b2-8e62-d083-c85ad9b085db@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a9b57156-4b2-8e62-d083-c85ad9b085db@inria.fr>

On Sat, Dec 20, 2025 at 03:25:46PM +0100, Julia Lawall wrote:
> cocci warnings: (new ones prefixed by >>)
> >> arch/x86/coco/sev/core.c:2838:12-13: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 2837)

From: "Borislav Petkov (AMD)" <bp@alien8.de>
Date: Mon, 12 Jan 2026 12:37:49 +0100

Use the proper helper instead of an open-coded variant.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202512202235.WHPQkLZu-lkp@intel.com
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/coco/sev/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 379e0c09c7f3..38dad3f5f491 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -1632,8 +1632,7 @@ void snp_msg_free(struct snp_msg_desc *mdesc)
 	free_shared_pages(mdesc->request, sizeof(struct snp_guest_msg));
 	iounmap((__force void __iomem *)mdesc->secrets);
 
-	memset(mdesc, 0, sizeof(*mdesc));
-	kfree(mdesc);
+	kfree_sensitive(mdesc);
 }
 EXPORT_SYMBOL_GPL(snp_msg_free);
 
-- 
2.51.0



-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
