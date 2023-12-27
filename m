Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A67446A1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Dec 2023 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bSmtkB7I"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a23566e91d5so578326266b.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Dec 2023 03:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703675528; x=1704280328; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QBVV0PEU9Ixo7XLjZnYGSo9vRDDhsR0F2qNKkSgsVpc=;
        b=bSmtkB7I2WjNy0A8pI51rGG5OXqZ61xjbyejocxAuKRHiYO/3/ZGsQptkUC+bEFgdY
         rmyLRdCGqkV0VXc9rptCpPY4D2Wp87yBKiEwfJOOppbsCxkfwZzeMH7JnIQTU8fUlK5u
         LPE/1pv4oJVXa/GPhtxbixbr0gizqoCMVQ/k+5ozNup7SjgkECHzaeQ3aymVJczrmL90
         XFzigY3Bq1MSU3BkGvNEalG/M8k2mwid8FcqA11PhF1wg+QmVXbtH4T6ti9Vz10E/CMv
         DIiN6DJrrH9p0b7/W1mqy5P18brylZ8OtPnV/w9HuuJZ+Nc1CQV0EZ9eQu2huZVytVqq
         hAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703675528; x=1704280328;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBVV0PEU9Ixo7XLjZnYGSo9vRDDhsR0F2qNKkSgsVpc=;
        b=uzsRTmGks5c/hsFzIpM6UankVS0L2nwqP4DP36Ofe7uVBS1K4fVUrqbNf+DFSaJoXH
         3j5jxIlD1R4rX2KO1PIKkGVttZWlyGK6oNLuFmlFRcl2KDmKtLF0GVSoNtQQKXFpqPNk
         6LFMvV/G4P36uR4z7Cuvbte3SNt5XM1HNSxiH1YziAIBsn4Ie+ObRSmsYZwt+qFQTj/k
         981eMFCdQ07Q4uGDhpeCSIEbHSt79QXOQFhvIkMpYvmDi92dRI+xKUpN/K0ZkTyuxawz
         5bqBj9qrj3sbwBuil9HUV5r9v3W8orjJsScMegZNiVIq3VBlFD8S4OnyEiEWcNXrLOhj
         eoFw==
X-Gm-Message-State: AOJu0YwD6DksLjTsWXa9nHFNOl/arcsfzy//fVbLX1nYNnaKXsGEQv8B
	6J6IXO12OzxyqcWIpUIgERdpiwuWtG0nq9b4Y3TCY+7/VPc=
X-Google-Smtp-Source: AGHT+IGzZWV5ur9CjQEtV+64thAuxA+gOAfookGHEM0PB7jmrpV10arquAMxnlPq8FB+om/ahwzGug==
X-Received: by 2002:a17:906:259:b0:a23:2e58:42af with SMTP id 25-20020a170906025900b00a232e5842afmr2398177ejl.20.1703675528598;
        Wed, 27 Dec 2023 03:12:08 -0800 (PST)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id zz15-20020a170907350f00b00a26c8c70069sm4468960ejb.48.2023.12.27.03.12.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Dec 2023 03:12:08 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Wed, 27 Dec 2023 12:12:09 +0100 (CET)
To: kernel test robot <lkp@intel.com>
cc: =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>, 
    oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/hid/hid-magicmouse.c:146: warning: Function parameter
 or member 'battery_timer' not described in 'magicmouse_sc'
In-Reply-To: <202312261056.AmFPDIL5-lkp@intel.com>
Message-ID: <nycvar.YFH.7.76.2312271211110.24250@cbobk.fhfr.pm>
References: <202312261056.AmFPDIL5-lkp@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 26 Dec 2023, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   fbafc3e621c3f4ded43720fdb1d6ce1728ec664e
> commit: 0b91b4e4dae63cd43871fc2012370b86ee588f91 HID: magicmouse: Report battery level over USB
> date:   2 years, 1 month ago
> config: x86_64-randconfig-x066-20230529 (https://download.01.org/0day-ci/archive/20231226/202312261056.AmFPDIL5-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231226/202312261056.AmFPDIL5-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312261056.AmFPDIL5-lkp@intel.com/

Thanks for the report. Now fixed in hid.git as below.



From: Jiri Kosina <jkosina@suse.com>
Subject: [PATCH] HID: magicmouse: fix kerneldoc for struct magicmouse_sc

Description for hdev, work and battery_timer of struct magicmouse_sc were
missing. Fix that.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312261056.AmFPDIL5-lkp@intel.com/
Signed-off-by: Jiri Kosina <jkosina@suse.com>
---
 drivers/hid/hid-magicmouse.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index c9c968d4b36a..a46ff4e8b99f 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -120,6 +120,9 @@ MODULE_PARM_DESC(report_undeciphered, "Report undeciphered multi-touch state fie
  * @scroll_jiffies: Time of last scroll motion.
  * @touches: Most recent data for a touch, indexed by tracking ID.
  * @tracking_ids: Mapping of current touch input data to @touches.
+ * @hdev: Pointer to the underlying HID device.
+ * @work: Workqueue to handle initialization retry for quirky devices.
+ * @battery_timer: Timer for obtaining battery level information.
  */
 struct magicmouse_sc {
 	struct input_dev *input;

-- 
Jiri Kosina
SUSE Labs

