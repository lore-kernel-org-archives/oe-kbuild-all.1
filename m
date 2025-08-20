Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8C12773F6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 09:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755682838; cv=none; b=oyJQXOTu7ynIbU4dtsdSimKZtFpF6lS3DUUp9+WhGtJSaihBSNVpwiJgVrrCIUk7WbXKRf92//2UC73V93q8ocxcJUM+OkX0uu2ItdPrmQACbyeEunmCM9gXMxYnkNB+gHCSPyE01xaoMuhe8HnzUyUHg7PVzIJlIA6TIYNKcBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755682838; c=relaxed/simple;
	bh=jseJB8mxRO8twsWpgM50wcB2CH10FcIVLbrukEtfdPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QEnfFPTgv4xKDBAso/a4M++J5jeMfVrY06hzNprb56ogvYRlZrPdO4f36ryipgGOgu1F86HEmPSDAS7TP9WqlkSUMVh6xJpat3WPKRnRl+a8oY+0ogHL051Ixu6PurR9vgKhqGafVJaYR/VCPs0Hf6m2eVcVLLS8dbwaMvByP1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HxmXl+/o; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HxmXl+/o"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb72d5409so945448866b.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 02:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755682834; x=1756287634; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NM0fyXJdFVsVnU/yS6K0gQI6XozNG1TCaWkFW+vAlK8=;
        b=HxmXl+/oG2W0jYIWkszNBuyifXTTWv7RJqkDS8XUTdBcpVOYYRDhOzQmev17PzPMOA
         5y/bfOh3xxJpzfaFot98wRVylzivKu6joVadsU/Ae8zemdlS7RTpDHso08yOQ7OGx5Ge
         vwUdCax1xgSD+nMhEyfFuMqKyhNVtFt+ocjNrwIrVfJHjXaIdr2BXLC289KxhVFe5D2H
         7sFg1Wix9ReHuUSjJRq6p8P3DE6CCjSQ3l/JTC2K6iFbZVZ2SA3N6zoyX0X7te8d6Q8W
         fDxkSHszoTgfct7EOuFFdZ2poodHhnERXTx0rf1VKfKCT6uIBNBGTa9PSBbBXabFD1gL
         2xAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755682834; x=1756287634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NM0fyXJdFVsVnU/yS6K0gQI6XozNG1TCaWkFW+vAlK8=;
        b=IFXwKe2If5ADRLZ7SpvOClINT2naqypFbah5t+t40LlF9WKjRtxLKnYKfGiUtUoCj1
         51KANZpWli+o+6Lsny/8gcUfvXCSWr+wAFYnCWNfT7NXW2+1DCcU1tWVWqaQlOWCC1J4
         4e79tHONWZJuUCWZLJ1mhUS4CvR2LP7eDXNA/t9bmZ87CSPeiytSJAQQPEtO2U9myazl
         8pHpKs/eMK4VJSqOg+cSS/tG9VJj71pdutr4USf2IZfl/urRkz7lMTsS+fjZ3mMJM01b
         RJ96ZeT/Wq8CALpPxD9r8zfP5jQIRpLAFYwnqWSNBGRF4wvimO5AsypjANYGg65SUaCC
         3eYg==
X-Forwarded-Encrypted: i=1; AJvYcCVv7GDntyTbo3b5Rt1VQBRakR8DZewvYYs5xSx6/teHkJ7b9SW1ywSWkbrH2fSmPsNhj25z8opNrZDUTLfA@lists.linux.dev
X-Gm-Message-State: AOJu0YxLHAONmFL/SSNYbns/kQvghpcRDIQX3i1nsHI/DS+xBzJNc5Vr
	5QzJFr9OYibKiKZw7NLsOJJccMHYUKp9FE53bo35SZ2YdBys+sntJHw6yVFFkJAdJ7g=
X-Gm-Gg: ASbGnctZf0Ss0D3EotFkAWNHCCnEAMUXLHRkbQ3XPZOS+qB+1FVHmkiN2amqcCCri73
	AbILD2crdSKW1fGOJO/xEwwB9HlIv9whal0AiIhRJ07YW9kYjRVt+vlzPwNVLjjW92ciXPJlQhY
	7SRkbUayT5hNO9vrCV2HiVMgURB6jvLwvGISXcZGccTg7uSukoT6ESyZDxJcK9xdXrjsY7xZ/i8
	RWJZ5ybQNmVv/TuzjCG6XjUWh08JVA8Ab5VCgjflNidizzyppUIhBFPlagejLFxOCRVf40lzz59
	YMyJ8sXMGCPPDTVT+1jSUF1i9qZcyXdZGCnpZ56hIPqJNlUVMbL+uR861AklgddF3ov2qt+9MfQ
	Hju3PS2gj7VIBHKpuna+D9Ipavw==
X-Google-Smtp-Source: AGHT+IEL5yizeK4oP3hcKNDpDCbogCgeCUIgrsK+feZZ6+ybN7ZuuNRbKKwxk5Z77sh2bbe8+uaS7Q==
X-Received: by 2002:a17:907:3c8b:b0:ad8:9645:798c with SMTP id a640c23a62f3a-afdf0209598mr168513766b.51.1755682834470;
        Wed, 20 Aug 2025 02:40:34 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded478a14sm148404966b.76.2025.08.20.02.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 02:40:34 -0700 (PDT)
Date: Wed, 20 Aug 2025 11:40:32 +0200
From: Petr Mladek <pmladek@suse.com>
To: Lance Yang <lance.yang@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	paulmck@kernel.org, john.ogness@linutronix.de,
	kernel test robot <lkp@intel.com>,
	Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH v2] panic: Clean up message about deprecated 'panic_print'
 parameter
Message-ID: <aKWYELPjbhC7R8NO@pathway.suse.cz>
References: <aKRJKZHgcxyNF3y7@pathway.suse.cz>
 <202508200907.PsZ3geub-lkp@intel.com>
 <ae9bb2ea-c6e5-4a4b-ae25-aea1d6fe084d@linux.dev>
 <33a897b4-7d9a-4641-9c7a-07c19bb9cb6f@linux.dev>
 <7a34da58-874d-4271-9dbb-7991468d58ff@linux.dev>
 <aKWWcPOf9qPIoCe4@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKWWcPOf9qPIoCe4@pathway.suse.cz>

Remove duplication of the message about deprecated 'panic_print'
parameter.

Also make the wording more direct. Make it clear that the new
parameters already exist and should be used instead.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
Changes since v1:

  - fixed compilation with CONFIG_SYSCTL disabled (kernel test
    robot <lkp@intel.com>)

Thanks Lance Yang <lance.yang@linux.dev> for debugging the compilation
error reported by the test robot.

 kernel/panic.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index 12a10e17ab4a..24bca263f896 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -77,6 +77,11 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
 
 EXPORT_SYMBOL(panic_notifier_list);
 
+static void panic_print_deprecated(void)
+{
+	pr_info_once("Kernel: The 'panic_print' parameter is now deprecated. Please use 'panic_sys_info' and 'panic_console_replay' instead.\n");
+}
+
 #ifdef CONFIG_SYSCTL
 
 /*
@@ -125,7 +130,7 @@ static int proc_taint(const struct ctl_table *table, int write,
 static int sysctl_panic_print_handler(const struct ctl_table *table, int write,
 			   void *buffer, size_t *lenp, loff_t *ppos)
 {
-	pr_info_once("Kernel: 'panic_print' sysctl interface will be obsoleted by both 'panic_sys_info' and 'panic_console_replay'\n");
+	panic_print_deprecated();
 	return proc_doulongvec_minmax(table, write, buffer, lenp, ppos);
 }
 
@@ -944,13 +949,13 @@ core_param(panic_console_replay, panic_console_replay, bool, 0644);
 
 static int panic_print_set(const char *val, const struct kernel_param *kp)
 {
-	pr_info_once("Kernel: 'panic_print' parameter will be obsoleted by both 'panic_sys_info' and 'panic_console_replay'\n");
+	panic_print_deprecated();
 	return  param_set_ulong(val, kp);
 }
 
 static int panic_print_get(char *val, const struct kernel_param *kp)
 {
-	pr_info_once("Kernel: 'panic_print' parameter will be obsoleted by both 'panic_sys_info' and 'panic_console_replay'\n");
+	panic_print_deprecated();
 	return  param_get_ulong(val, kp);
 }
 
-- 
2.50.1

