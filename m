Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2625934BA56;
	Tue, 13 Jan 2026 16:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768322861; cv=none; b=R174XxGrhPN8C/cMY8HmNi81eOcF6KMD41SB1rKf/00E+BJ3n9RYD+KusNgQRpfLL7KZbRLmH32rcRV7JRt5D4LA2EBq7LAiwfD2WiNes+ACHgOFjFrhuVMOkmruSud37v6do0P4piz8L6+YpnnMuuhsLOvsNbxCOQ1xYjsbkJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768322861; c=relaxed/simple;
	bh=D42mceYbz9D6Kn/zpcalTO5W6UzhiH2eZDaNez+//Jk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HKLnzIUm/KQ4CF6HiKxQuRZymm7F8IGQhw5V3yP1fIwXNXTPa+Aq3gLw82VkCfKDZH/32tmkYtvpZhKwtOQuzRbE4YrPbGPU1h3n1V75sJH4q7iwLoKJGMao8Fgq3QwBVSHMlRy0stwbXxsCoAF2+8EE6rzBNoh4UsOxuYfDp/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JaeUrYVA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JaeUrYVA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8A6C2BC86;
	Tue, 13 Jan 2026 16:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768322860;
	bh=D42mceYbz9D6Kn/zpcalTO5W6UzhiH2eZDaNez+//Jk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JaeUrYVADX+X7y06llWui08o9hdlCzmi4EHeD+NAdfUVR8qg7HcgjBu0MffnziRPJ
	 6wAvTKfJ25tMKxWbX6UQtkR4olqxhIeg8BrfB8qN/KqzIcJhQkmuWWPqyP335F+RnK
	 nUSp3pPOHPVecWxgReQXHCg04e8mKkOF3nu4pZmr9WMDiDEVbkOZ+ji85CLeRmEW49
	 lp/fNJ5P5o51X8AonJxaLaHtMSAyfantTlVmf5Wlk6/EkeWgdvXI+GpE4UZA+pUTm+
	 FLvIqGJ+UHbSBZukaQ1Z8u6JI3sFhQHH3ECQo/+/Hr9Odihixo5+ifxDDArfeoCorq
	 M2HcEwh0UWeIw==
From: Thomas Gleixner <tglx@kernel.org>
To: kernel test robot <lkp@intel.com>, Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Ingo Molnar
 <mingo@kernel.org>
Subject: [PATCH v2] time/sched_clock: Use ACCESS_PRIVATE() to evaluate
 hrtimer::function
In-Reply-To: <87jyxlk3w4.ffs@tglx>
References: <87jyxlk3w4.ffs@tglx>
Date: Tue, 13 Jan 2026 17:47:37 +0100
Message-ID: <875x95jw7q.ffs@tglx>
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
V2: Send the actually functional variant...
---
 kernel/time/sched_clock.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
--- a/kernel/time/sched_clock.c
+++ b/kernel/time/sched_clock.c
@@ -215,7 +215,7 @@ void sched_clock_register(u64 (*read)(vo
 
 	update_clock_read_data(&rd);
 
-	if (sched_clock_timer.function != NULL) {
+	if (ACCESS_PRIVATE(&sched_clock_timer, function) != NULL) {
 		/* update timeout for clock wrap */
 		hrtimer_start(&sched_clock_timer, cd.wrap_kt,
 			      HRTIMER_MODE_REL_HARD);
