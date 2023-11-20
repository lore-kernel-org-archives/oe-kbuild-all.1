Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8D31D55B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 15:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lV0BQrEo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BHOt5HeO"
Date: Mon, 20 Nov 2023 16:39:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1700494794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7jKa+73bOkmstRrVLNFByvwYpmmA0HUVCWi0eT+FJSg=;
	b=lV0BQrEoFA00H4hA5ap5xjOuF2taI/iHHSngCA+qrOqx7DcRqlMR1YG5Nfdgxu/qahSQAr
	YiE4hRTD+iBYvLF5PTXZrziSQErL7WO1Gl854T6BhiFt4WqJNxaRBRjxBg42l4gAveQf9a
	JqCM/RnJFJmnC5XX51GAUJO+PVcGBSfhNgmVM9uOma03dSBirHM0Hz0raLudS/hVpPjnJU
	S4VKkF/+n3hRBPOSYcQLmdaKwLxUkSaMZ+vncGELRljDm3Pa/uEAb0JwseZonGpHH9GWOG
	t/QJwVhruibfT2qdGkek4DLOMogdZlCdhcR/uZ9j0FDOy3CUmXWUG14O6ZKkyg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1700494794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7jKa+73bOkmstRrVLNFByvwYpmmA0HUVCWi0eT+FJSg=;
	b=BHOt5HeOK4aLojRPZbdWRrX6O2NlXUna85NobobWNb4fgLHsDDVLelJhPNLvjCowcRlxYw
	3e3d8m/dYXjR4eAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] hrtimer: Make the argument passed to lockdep_hrtimer_exit()
 look used.
Message-ID: <20231120153953.kGBSHe5j@linutronix.de>
References: <202311191229.55QXHVc6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202311191229.55QXHVc6-lkp@intel.com>

The lockdep_hrtimer_enter() macro returns a value which is then saved in
a local variable. The value is then fed to lockdep_hrtimer_exit(). In
case lockdep is disabled then the value remains unused leading to a "set
but not used" warning by the compiler.

Make the content passed to lockdep_hrtimer_exit() look used so the
compiler does not complain about it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311191229.55QXHVc6-lkp@intel.com/
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/irqflags.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index 2b665c32f5fe6..2e09c269bf9d8 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -126,7 +126,7 @@ do {						\
 # define lockdep_softirq_enter()		do { } while (0)
 # define lockdep_softirq_exit()			do { } while (0)
 # define lockdep_hrtimer_enter(__hrtimer)	false
-# define lockdep_hrtimer_exit(__context)	do { } while (0)
+# define lockdep_hrtimer_exit(__context)	do { (void)(__context); } while (0)
 # define lockdep_posixtimer_enter()		do { } while (0)
 # define lockdep_posixtimer_exit()		do { } while (0)
 # define lockdep_irq_work_enter(__work)		do { } while (0)
-- 
2.42.0

