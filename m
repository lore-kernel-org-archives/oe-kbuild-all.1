Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204297;
	b=bqqb2lTQnwBVsOoajfZo/b2CDE0VB5dxga/g3DKtZlWJnNv9ZZRP7xF7nwTmEaH2YfWH
	 PnPYAh5vak8qlX6p2KEpJEFcJo1+sZ6w7hRXGHxIQTtThjLz5a8dHGcmumihXIKE/wQAR
	 Hm+lQbbE5vSC2wJ3Xp3wvIeo983EiWtURXhq3NNnWLHoG3Xz3R/SxXODqcIzO7gjptigN
	 UmUnffx9Kj8pKoODLR6TS1rLxH24i3e8LJG3fdfr0g9y+5ZdOwX7ACzMQuxHvAhZlFPx2
	 HAARj0Veou52D3DMQcps8r4j9oZXO6KRkP+0+4q9eTGWWDyo5XjeAGK+nSJ9JzpcgQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204297;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=vAGrw9tEAGm8z9R7foOuoAQAbjSzUhL5memr9dSJwbY=;
	b=I6Btau4o8S0SFQgQiUopCTDqLa0w9n9G0Pa9NRFEqwqEuUM4oUtXCuk8XjDB8Kh1w0t4
	 cwigKRKddK+p+iPUXP0DJBkZ85hX/2/LPG6eAD0eUtfZ1i2yyF47omqIJoLimZEWDQ2/J
	 Pl/8aIvZI3mUaxxbWaq+hFZOF8PwkI+dwOLnEDjLyIzG1RF2iqyyzIt1L6tYMN94jnQl1
	 11rPGKu4W8JzuQelVm4oRb7W+w0zVQFxc3rHhu2uKawmpJv+18H0Rk4inNhLOH9e0CBal
	 aAdg+8wZMVmE0CbcmuWdHBxnZUAbK4RDS7j1+3kGlDN1Hcytqk6D0wL4hwYIlD1WPhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bU38sA++;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903BE606A6C9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 19:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bU38sA++
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35A21F000C6;
	Fri, 20 Nov 2026 19:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795204297;
	bh=vAGrw9tEAGm8z9R7foOuoAQAbjSzUhL5memr9dSJwbY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bU38sA++qlXY91Kek0OjLMo9a65hj0q0PQHMYqCeF5WHNWq/2Pmcv68zQL98x0hiz
	 FQiXonp8EHSDWQwyYCSuKVZWx7c9XFe+GCoppcQYWuXY7okS4VW4MGkGRE2Wt/Z7vD
	 peZFJwMj4MzRBJhsBJW6h+sNmVXyJpAkpBZW+yYHTl36Xk487hTZ0ub+/uoP9qNy5V
	 3u0Cp74A6fHi9iTXk3t9oC/ictVF2WCxVrKSvz/wliDPrVb0Qc/4IDmTIHmED5G05f
	 Yft/fYtJ4G9VQhPhWhFi98J0f7QyvFQ7jOXhfnZNjROgx1lFuk+ERPxHixY4yo/8uo
	 2xSInGnV5Su3g==
From: Sasha Levin <sashal@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [PATCH linus-next] platform profile: Use PLATFORM_PROFILE in the asus drivers
Date: Fri, 20 Nov 2026 14:51:34 -0500
Message-ID: <20261120195135.613480-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120181059.GypXyRIq-lkp@intel.com>
References: <20261120181059.GypXyRIq-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 699041135f75 ("platform profile: Extract the core from ACPI") in
the pm tree renames ACPI_PLATFORM_PROFILE to PLATFORM_PROFILE. Two users
from other trees still have the old name:

commit ef696e89f836 ("platform/asus: Move ASUS platform drivers out of
drivers/platform/x86") in the pdx86 tree moves ASUS_WMI with "select
ACPI_PLATFORM_PROFILE", so a config where nothing else selects
PLATFORM_PROFILE fails to link:

  ERROR: modpost: drivers/platform/asus/asus-wmi.ko: symbol 'devm_platform_profile_register' undefined!
  ERROR: modpost: drivers/platform/asus/asus-wmi.ko: symbol 'platform_profile_cycle' undefined!

commit d220bf485598 ("HID: asus: Cycle the platform profile from the
Zenbook Duo profile key") in the hid tree checks
IS_REACHABLE(CONFIG_ACPI_PLATFORM_PROFILE), which is now always false,
so the profile key does nothing.

Fixes: fc099de5a4ac ("Merge branch 'pm-next' into all-next")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/20261120181059.GypXyRIq-lkp@intel.com/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-asus.c        | 4 ++--
 drivers/platform/asus/Kconfig | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index dcb3d50f9288e..aca4ab6ab2391 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -438,7 +438,7 @@ static int asus_platform_profile_cycle(struct asus_drvdata *drvdata)
 	struct asus_worker *worker = drvdata->worker;
 	struct asus_work_action *action, *pending;
 
-	if (!IS_REACHABLE(CONFIG_ACPI_PLATFORM_PROFILE))
+	if (!IS_REACHABLE(CONFIG_PLATFORM_PROFILE))
 		return 0;
 
 	guard(spinlock_irqsave)(&worker->lock);
@@ -870,7 +870,7 @@ static void asus_work(struct work_struct *work)
 		asus_kbd_wmi_fan(worker->hdev, &action->data.fan_hid_data);
 		break;
 	case PLATFORM_PROFILE_CYCLE:
-		if (!IS_REACHABLE(CONFIG_ACPI_PLATFORM_PROFILE))
+		if (!IS_REACHABLE(CONFIG_PLATFORM_PROFILE))
 			break;
 		ret = platform_profile_cycle();
 		if (ret)
diff --git a/drivers/platform/asus/Kconfig b/drivers/platform/asus/Kconfig
index 4b79957f045fc..0219418ce3523 100644
--- a/drivers/platform/asus/Kconfig
+++ b/drivers/platform/asus/Kconfig
@@ -127,7 +127,7 @@ config ASUS_WMI
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
 	select NEW_LEDS
-	select ACPI_PLATFORM_PROFILE
+	select PLATFORM_PROFILE
 	help
 	  Say Y here if you have a WMI aware Asus laptop (like Eee PCs or new
 	  Asus Notebooks).
-- 
2.53.0

