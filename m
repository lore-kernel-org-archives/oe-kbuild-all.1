Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C077256A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 10:08:16 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id o8so10611635pls.11
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 02:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wmt2hj8MCXPWivVGluzxTzv8s1mbr/NRUGMnH83VafU=;
        b=UT3Vr4U4NWBxsvDPW7eP6ZIjdmkDSQinHWZDUqsvvt/5M4afAaX+CfjRHJdmt4tLPH
         YbzGPi4j99ZuZWH8XAOd4+TPoUmY8qhPXJyttq4ibWXv0n093BoccnzL4Xgqy28QW520
         hUbvkyM1xBl1cNP29+sCJiOjkxx3J2o3JfDB66OBgiJ1r1vSCaKJX2WXSjq03mW+gL/e
         rkPe5exMZxqa7tvx1rttkPRI+uT5Ai0DA6du18Wa4iRod/wSLDZxsGYx28VnGJa5oZ1g
         nBgei5hCaavWFn4fvjcQrXVACOJlvA4FYzGn6NXBgBB9PnRmbqXoYxQnQfqMFGA5bOdM
         JQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wmt2hj8MCXPWivVGluzxTzv8s1mbr/NRUGMnH83VafU=;
        b=A9HPDT/WwKn1OA6ujgCDcKd9rW1eXwts7Y5KacCOVhHgnXfEweE9ZDBzO1dg/oQAIR
         zKmMZjlCuGMzx17+ZAxSqzcb9omwFjfZQP1Ep1xIXW1yNbVj3nL3+6IwQcc6CzHPCKj6
         609IFp5DPZncb2+K2y9zqrZ60kO/ksc9XiQ692OJgH4lhSy4rn0U5q38UMkQ5/XLGGQT
         TR76VX3zaMC/mAbBGl8h1xnSJfiNjK/uYrheTEN75M10dEa0vDixtfXK0vGUzZlazQwV
         kCvKXmo7tnb8BgSy/TOw3q8VC9nBd6eYkDHa2UM1UAP1pyBP/KiDX0UA4eXGxqs3fFyh
         htrw==
X-Gm-Message-State: AO0yUKV9faZGD7bk8l417O9losHzJYi1W8cxFoilaGcsuzP8v/ALzdbp
	cm9PfsoCFCZRFkn7OatSBCQ=
X-Google-Smtp-Source: AK7set8Uona5UZT0f1asEgpKdRLkxQM6Kz0KS5qCzQzoX3My9RRMRr7o2AH2pj2zEZWic5CmrfeILw==
X-Received: by 2002:a05:6a20:8f09:b0:bf:a1c:3ff0 with SMTP id b9-20020a056a208f0900b000bf0a1c3ff0mr32838576pzk.52.1676282895696;
        Mon, 13 Feb 2023 02:08:15 -0800 (PST)
Received: from debian.me (subs02-180-214-232-93.three.co.id. [180.214.232.93])
        by smtp.gmail.com with ESMTPSA id s3-20020aa78d43000000b00593906a8843sm7838870pfe.176.2023.02.13.02.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 02:08:14 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id 2954F105573; Mon, 13 Feb 2023 17:08:10 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Power Management <linux-pm@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Arjan van de Ven <arjan@linux.intel.com>,
	Jacob Pan <jacob.jun.pan@linux.intel.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH 3/3] Documentation: powerclamp: Fix numbered lists formatting
Date: Mon, 13 Feb 2023 17:08:01 +0700
Message-Id: <20230213100800.28333-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213100800.28333-1-bagasdotme@gmail.com>
References: <20230213100800.28333-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2157; i=bagasdotme@gmail.com; h=from:subject; bh=3gc7y0tNpDoADlWChYza1/YENDn5axrW4AhOnQf+M94=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDMmveBj4g9a/7g/TfN+y31J/2wwTle0OIonPFtV3aHuzfNIs Wrero5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABPxPc7IsHbJ1+dN/MxvOh4tr1v3W1 g6X0xnb777kvd/Jv372m7gfYeRYfqh/pTJ23buUL7s0rTGq3uD2lFb64MB93et+vNhfvqRtVwA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Texts in numbered lists are rendered as continous paragraph when there
should have been breaks between first line text in the beginning of list
item and the description. Fix this by adding appropriate line breaks and
indent the rest of lines to match the first line of numbered list item.

Fixes: d6d71ee4a14ae6 ("PM: Introduce Intel PowerClamp Driver")
Fixes: 6bbe6f5732faea ("docs: thermal: convert to ReST")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 .../admin-guide/thermal/intel_powerclamp.rst        | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/thermal/intel_powerclamp.rst b/Documentation/admin-guide/thermal/intel_powerclamp.rst
index f919fbe1cdd942..3ce96043af1797 100644
--- a/Documentation/admin-guide/thermal/intel_powerclamp.rst
+++ b/Documentation/admin-guide/thermal/intel_powerclamp.rst
@@ -155,13 +155,15 @@ b) determine the amount of compensation needed at each target ratio
 Compensation to each target ratio consists of two parts:
 
 	a) steady state error compensation
-	This is to offset the error occurring when the system can
-	enter idle without extra wakeups (such as external interrupts).
+
+	   This is to offset the error occurring when the system can
+	   enter idle without extra wakeups (such as external interrupts).
 
 	b) dynamic error compensation
-	When an excessive amount of wakeups occurs during idle, an
-	additional idle ratio can be added to quiet interrupts, by
-	slowing down CPU activities.
+
+	   When an excessive amount of wakeups occurs during idle, an
+	   additional idle ratio can be added to quiet interrupts, by
+	   slowing down CPU activities.
 
 A debugfs file is provided for the user to examine compensation
 progress and results, such as on a Westmere system::
@@ -283,6 +285,7 @@ cur_state returns value -1 instead of 0 which is to avoid confusing
 100% busy state with the disabled state.
 
 Example usage:
+
 - To inject 25% idle time::
 
 	$ sudo sh -c "echo 25 > /sys/class/thermal/cooling_device80/cur_state
-- 
An old man doll... just what I always wanted! - Clara

