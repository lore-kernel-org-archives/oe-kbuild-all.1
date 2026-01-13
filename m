Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3D638F954;
	Tue, 13 Jan 2026 14:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312911; cv=none; b=IhzyrTBryi9mgdAid7djKv0OU/Ikhuw1Np8Vs1p7LV7qiB2QDvKarYqixXNDXiUvGHarP4cSD9SyeAyKaB3l26Krm0+GtJKDauzIms1013d4lM46biuP55TN16ljbXMbgtYZZxhalzZ/RCzLBbup+vUZ5RILQRA7TMLkYYY9FiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312911; c=relaxed/simple;
	bh=Ky5VSxrU0PMcDbX+1v+S7rmG55ge1p1tE92wE4WB7yc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=k4tHGXs015ax3FuQ+5XizB4E8zx5qaKX0z6AdLGtuh0YRsBzcHRd+csusjOEGaQMQKRYv9b1ztECTrxf4A/9fVkc0M6k+Hl2/OgSpRucShBBr9+coP+vfd5FMqmbqDcbEf+XjkepNFi/DxvmHiu17+44kvuwUFc15TCkt/rDtLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hK1ya/+u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hK1ya/+u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115FFC16AAE;
	Tue, 13 Jan 2026 14:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768312910;
	bh=Ky5VSxrU0PMcDbX+1v+S7rmG55ge1p1tE92wE4WB7yc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:From;
	b=hK1ya/+u1Uu7554P1dNavMAXY4O/+Pby1VPfgNaFx7vA8+4JY7wQr9G7mmD78wBv3
	 8KPFbrWCuAHA/Roskl03a3o25MWsMiqVSenuVtsomDiHYhTcgwetuXURqzW7VtxdvL
	 GzTzekggstpwL5slfS3N+TB6KB29HYz/xgrC2nQ165A5/8XuTxje1PLi7MxOWoEnau
	 xB+nqsIrVQ1r9p+QEi0HcEyivFO2mutO1FGMreTTTd/FlGUQf7iSFCj8GyUONfx2uq
	 a1Mi8v1ArwfJGeLk5EVTa39CFp5V8OBaHTSdom9YQaOieqmDTcNPr7xqJyPxf+XAzK
	 pBZ+w3hkfK4wA==
From: Thomas Gleixner <tglx@kernel.org>
To: kernel test robot <lkp@intel.com>, Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Ingo Molnar
 <mingo@kernel.org>
Subject: [PATCH] time/sched_clock: Use ACCESS_PRIVATE() to evaluate
 hrtimer::function
In-Reply-To: <202601131713.KsxhXQ0M-lkp@intel.com>
Date: Tue, 13 Jan 2026 15:01:47 +0100
Message-ID: <87jyxlk3w4.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

This dereference of sched_clock_timer::function was missed when the
hrtimer callback function pointer was marked private.

Fixes: 04257da0c99c ("hrtimers: Make callback function pointer private")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Closes: https://lore.kernel.org/oe-kbuild-all/202601131713.KsxhXQ0M-lkp@intel.com/
---
 kernel/time/sched_clock.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/kernel/time/sched_clock.c
+++ b/kernel/time/sched_clock.c
@@ -215,7 +215,7 @@ void sched_clock_register(u64 (*read)(vo
 
 	update_clock_read_data(&rd);
 
-	if (sched_clock_timer.function != NULL) {
+	if (ACCESS_PRIVATE(sched_clock_timer, function) != NULL)) {
 		/* update timeout for clock wrap */
 		hrtimer_start(&sched_clock_timer, cd.wrap_kt,
 			      HRTIMER_MODE_REL_HARD);
