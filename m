Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE4D12E5D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 17:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848424; cv=none; b=duEHKnmKcAjMxNDMGEL2zl0Fd5J2FZyf1InQ1EFU2shnWc+ou7Qw4LWrPkdcfhQPiv7OProAxER0kokgSbkOwCnqqK3Z9vKMmhnwromI4f1XGafgHsK0GHb/1LUPX/4i5QN+aqwpwvh8Be0GhdXxM4XhOSpurYvR3OGPQymqZyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848424; c=relaxed/simple;
	bh=Ozf2K5aLWxUcsueIVSaKOvz59INQJwnTXOlW4JzMWoo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vzl5UkyQZ4sFntFemeSUTACuWXQDKE/9wAqJdrtzixAoZ3Uo/xB8NJKFS0kQBP9CiWa6O/UTgwyojEjLO+rMUK8Qo9n6y/JqbbKlc1FVYBoO54HVY6uLPSVF2YeqvlTM5MQNDkdPLE94tUgU2fGKO/iYA6uHlVtotAv/7NlbNmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=fhQhKMgC; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="fhQhKMgC"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8BA21A2540;
	Wed, 21 May 2025 19:26:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1747848413; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9ZOwVLxDdRlVFdc4Md6tASgtfCFcbsCuBgUjD/USceM=;
	b=fhQhKMgCZOphb0Zs+ry/C17CoKBQcT1oNGeZI/wGCdMSZanyB7DGoJJ201prtjw2LsVK/a
	jCd+vik69LbvcA8S2L6mDq06TQtDzTj+7f1fTROTPb45atJvkQ12bUUTPcNBroMlEHiGSz
	ug5FtZomm20TzfO5+AFJoQ4tyATH16Aa9ED+2mrv3mIR93m5n8rJEK0S+6Ym2w+mqxCAe8
	ILl7iwy6XwbHLDgXycpGGcF5uk8PR9sAKZOPGPh5KyREE/4atUfQg2KGQS2hUOeOImcb+9
	jwg6y5AvWIGof2chWwXo2epr83fJ/iRJUe3fj7VXsT3uMZBQLNhWyJcv1TjAoQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: lkp@intel.com
Cc: cjd@cjdns.fr,
	fazilyildiran@gmail.com,
	linux-mips@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	paul@pgazz.com,
	tsbogend@alpha.franken.de
Subject: [PATCH] mips: econet: Select SERIAL_8250 because SERIAL_OF_PLATFORM depends on it
Date: Wed, 21 May 2025 17:26:45 +0000
Message-Id: <20250521172646.461046-1-cjd@cjdns.fr>
In-Reply-To: <202505211654.CBdIsoTq-lkp@intel.com>
References: <202505211654.CBdIsoTq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

config ECONET selects SERIAL_OF_PLATFORM and that depends on SERIAL_8250.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505211654.CBdIsoTq-lkp@intel.com/
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c3dbdc808664..b23122633a02 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -398,6 +398,7 @@ config ECONET
 	select DEBUG_ZBOOT
 	select EARLY_PRINTK_8250
 	select ECONET_EN751221_TIMER
+	select SERIAL_8250
 	select SERIAL_OF_PLATFORM
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_HAS_CPU_MIPS32_R1
-- 
2.39.5

