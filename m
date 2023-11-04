Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A5156E8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 11:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MChX6MU6"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7ac7b2b1e99so107064339f.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 04 Nov 2023 04:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699097631; x=1699702431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1unSOhmm2Wdrkotg5oMVcVzXjBgM2cS465ES0k4jZY=;
        b=MChX6MU6x99000C2cAtkW/FHr6zVNkT10/L4QRY3kwJPGStju7krDrwkxZ47wRJ9ox
         qVxcsan0an+ftqLJi1eVkC0aKqGVcneJLkfpVhMn0Ws1DyPX7Hv9m86e4bTcQLLs258h
         NlUTrRCVxwj82mCwtSrTYjTZvi1YmbadgJfgM9MrwRYAf/VuGAn3zDaLJlb/0cMZHgwP
         OnrQpJMghgZVS2LD9AnZCrAGA5ahPJNmLjoxLRoF1htSB/IvVlByGQCYB3sb9rmvR4do
         idTdHiZFXBNvbDxxfagFo7rg2eo6UWNuLg8RIeczp4fdOzIeO05M6nnigKQnED8EBMsn
         01Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699097631; x=1699702431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1unSOhmm2Wdrkotg5oMVcVzXjBgM2cS465ES0k4jZY=;
        b=eBafxNyNk0jWm8SZXRERCkbzgJwrxaYbHdA9HW8xoTPtM7J7RaMHLtUQVfvH4ewLxa
         9oIHT3QTCiw6sPpcXTghHwnpmcvadZ00eHhr5FsroFjXNQkuaHN565v9e6m17lDvg+ww
         HXMe9n1LfMCa2l8wfUFzUR9PxV0ciSem2lw/83YrtqWdhuhDT61rcIslTioKdExa5dO0
         BUCMu9CnRbfbmI8UcwyFarJgxyQTfNAPUmzQuetmC8VXOARevJG/vp1qFn6eHGIfpTTO
         1l24CiAoXdQtYG9LLsR9/L9ZP7qSNiN+OUHXJ4ydFbeFkZuSBB1nz7znGhPOLuIi6Al+
         srNw==
X-Gm-Message-State: AOJu0YyCoHitTGqhVlHMIgEORKVFUcBr/q3gTATWksZk2eGtuj0OM8tk
	fBXOxADs6nth0anjwB9fbsE=
X-Google-Smtp-Source: AGHT+IHfkBqDHcaXI13I92jFq4qe3R1jf5ec6iYP0G/J/Ox9Y1sauYyZzUUWFb+D/sypQGu+WI6viA==
X-Received: by 2002:a05:6602:2acf:b0:787:ff98:c38c with SMTP id m15-20020a0566022acf00b00787ff98c38cmr32189338iov.10.1699097631080;
        Sat, 04 Nov 2023 04:33:51 -0700 (PDT)
Received: from localhost.localdomain ([182.225.11.211])
        by smtp.gmail.com with ESMTPSA id v10-20020a62c30a000000b00692cb1224casm2921823pfg.183.2023.11.04.04.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 04:33:50 -0700 (PDT)
From: Dongmin Lee <ldmldm05@gmail.com>
To: akpm@linux-foundation.org,
	lkp@intel.com
Cc: ldmldm05@gmail.com,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH v2] kernel/reboot: Explicitly notify if halt occurred instead of power off
Date: Sat,  4 Nov 2023 20:33:20 +0900
Message-Id: <20231104113320.72440-1-ldmldm05@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <202311040832.yiyrijgk-lkp@intel.com>
References: <202311040832.yiyrijgk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When kernel_can_power_off() returns false, and reboot has called with
LINUX_REBOOT_CMD_POWER_OFF, kernel_halt() will be initiated instead of
actual power off function.

However, in this situation, Kernel never explicitly notifies user that
system halted instead of requested power off.

Since halt and power off perform different behavior, and user initiated
reboot call with power off command, not halt, This could be unintended
behavior to user, like this:

~ # poweroff -f
[    3.581482] reboot: System halted

Therefore, this explicitly notifies user that poweroff is not available,
and halting has been occured as an alternative behavior instead:

~ # poweroff -f
[    4.123668] reboot: Power off not available: System halted instead

Signed-off-by: Dongmin Lee <ldmldm05@gmail.com>
---
v1->v2:
 - changed new variable poweroff_fallback_to_halt to static bool as per
   kernel test robot's sparse warning notification.
 - fixed minor coding style issue

 kernel/reboot.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 395a0ea3c7a8..34ea519e3d94 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -58,6 +58,13 @@ struct sys_off_handler {
 	struct device *dev;
 };
 
+/*
+ * This variable is used to indicate if a halt initiated instead when
+ * reboot call is invoked with LINUX_REBOOT_CMD_POWER_OFF, but system
+ * cannot be powered off. This allowes kernel_halt() to notify that.
+ */
+static bool poweroff_fallback_to_halt;
+
 /*
  * Temporary stub that prevents linkage failure while we're in process
  * of removing all uses of legacy pm_power_off() around the kernel.
@@ -297,7 +304,10 @@ void kernel_halt(void)
 	kernel_shutdown_prepare(SYSTEM_HALT);
 	migrate_to_reboot_cpu();
 	syscore_shutdown();
-	pr_emerg("System halted\n");
+	if (poweroff_fallback_to_halt)
+		pr_emerg("Power off not available: System halted instead\n");
+	else
+		pr_emerg("System halted\n");
 	kmsg_dump(KMSG_DUMP_SHUTDOWN);
 	machine_halt();
 }
@@ -732,8 +742,10 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
 	/* Instead of trying to make the power_off code look like
 	 * halt when pm_power_off is not set do it the easy way.
 	 */
-	if ((cmd == LINUX_REBOOT_CMD_POWER_OFF) && !kernel_can_power_off())
+	if ((cmd == LINUX_REBOOT_CMD_POWER_OFF) && !kernel_can_power_off()) {
+		poweroff_fallback_to_halt = true;
 		cmd = LINUX_REBOOT_CMD_HALT;
+	}
 
 	mutex_lock(&system_transition_mutex);
 	switch (cmd) {

base-commit: bc3012f4e3a9765de81f454cb8f9bb16aafc6ff5
-- 
2.39.3 (Apple Git-145)

