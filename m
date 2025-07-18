Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940962DE1F0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 15:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852449; cv=none; b=aHXy9xAw5fd1M+tbvrLa8Pp/wDoHGc9WsIMMAGMQ2otfbYRGKRuIGJTsb3oFE+312wqJgTbkp0yRQQXoT0nMQHwz9Ab0O3kHM2A99yDRG4iYSJekrMCgtaeg3yc1gn8Oa9TH0uai0Nk1PH+zOkMVO9urvUjJ4njIIoVlmTAoOpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852449; c=relaxed/simple;
	bh=ok3ivDYRuNQPcJYkzQ/LOj7nL7uE52sAZj+wDl34c+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXJqaAk1kvj4SqGKvrR9NwAsaKGHVHo0NzLqYz6DoJDLnvY4FFUJMtdhDuPxsj5eaRYUxKt9Lcf2hkpLE/RMuRqnTwNpOm6DJ/Vs961r7wbZJ4oUZBmvWvXlw9gFT2CwKeR36uRQJtCgnMEo0VScwUByy0d4PJWkBSozZ+ehex4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCAnU4xO; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCAnU4xO"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7086dcab64bso22074007b3.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 08:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852446; x=1753457246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F66N0wil7J+HbPwMNjuizTeNTbRlp/Sh4yJnp4lMFrY=;
        b=MCAnU4xOgvUL4NTD5LtSu3vW2ldV2tKwoN41Mo2wbmn9o17RTgo0eeexjmNN7v+ahu
         koFlxl+1sDK4TwGwJ6JlfFm6F569Yb10HbUiftrSAoYXEkr+PO6n3YPCP/MDNEZOOvpR
         oVqE2or2fDfnW4I3khBjDSyQ9UrSXJplS8RRMxFWzBiMFt2t/Jr4rFEFX309Wbxotn3i
         Ff/NcMUbqEK9LcvZYz6S5BSNeBvRqr3FCK/MEIwaJD7omGFKES6qHOKBL1EBW5wdggeF
         x6rtAfGS0CDWUeEMeCPNBbFjqgnFV4B5fGq8ABTAL9Ayxw9dsYJqzKnNAHWPBP/jrmMO
         ee6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852446; x=1753457246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F66N0wil7J+HbPwMNjuizTeNTbRlp/Sh4yJnp4lMFrY=;
        b=Fgjm5Pmi9DqjGhWVrGEDJU6TWn9JmGUCNdfkYIRj4bLD7gBI6zZNlPuERSlk+PEfXE
         BjO7FBw3SZ1PafzJ8yVxhVUQq0qZR6f623NJ7ZoVaz+fDQ/oG54Vc3Mv2r3M7Q5Q3gbh
         7yjwRrrDDs2OTIHLp7sXSaLYVB7VelucyhQFktmpiINcq7xlq4J3zPuwtJ0qrEKBRLql
         FMr/jJ0mHOpoaIEtQCjRDIxndfTIVXso5B1sz1Im5Z9ODpBFW45orzGQcS7Y/PLR15v8
         hoiG8A19EwkkPc6al+AyNThK6vsoSNxKdjlLg22bhDi164OBii3/yoLSRwduP7AMCejI
         oAtg==
X-Forwarded-Encrypted: i=1; AJvYcCUE1A2Tk6sF5ufwU36roxt6IyWtC2BnI2bcsZKiCpu0OmBDIMlVYiLGZiQn0kUqUGxmnVJZCEdQdMedsHnM@lists.linux.dev
X-Gm-Message-State: AOJu0YwApdDIZisHMGXLGBCFgMA+QgcgdONnO6/XGBlX6VXOFdKE46oS
	XcWB7Wc0L6b8sZk+209dETi4z/gq7zTDh1NUy31hzvLuetxhwz2tRNCC
X-Gm-Gg: ASbGncuHusORVYlestRbzCc/0YL9VBRQcABkEM/xzJavsy+54QpSLcyrBzj9P7/sk88
	WyozN4qeqxEjSEqboUfNLSJe/3T2fImX8ramE31JP5rRAn5uEXrQy0ZiKek0wvzH6yEVSr8Ud3t
	CPYkXx5YGfxyNSC4ZBk3f6lSwSDzu46ESJGPOdQPjx/jy3CE1KUSgDh8foKJ88wzOeXyjZZOz3k
	109iGd6FVbkacp8uSdIaqdCyqN61HEGqJjrJ/KkS0a1gZZKIraK+1OJPPiaYDt9MO+QXHehJ8TT
	U8jBf7sLP45Ytlu6mwF2GKtZJUdJ04lcKkeR0O8l1ZqiC5sZLvsAoGoXEItA12BPIL29Pnit9zt
	fiZuPyrvXDsoi2kQIoN/DWA==
X-Google-Smtp-Source: AGHT+IEHt3k5CxyEPCwLRVQs6pZJ7u5eFljYq50VtW2JoGNL1uq6TN77Q4wUo1jx7bSmHFInqIZlnQ==
X-Received: by 2002:a05:690c:9a0c:b0:712:e2b5:e61b with SMTP id 00721157ae682-71836ca03bbmr155585107b3.13.1752852446394;
        Fri, 18 Jul 2025 08:27:26 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:5f::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-719532c7e9bsm3683787b3.61.2025.07.18.08.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:27:25 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Xiu Jianfeng <xiujianfeng@huawei.com>,
	oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: mm/hugetlb_cgroup.c:829:44: warning: '%s' directive output may be truncated writing up to 1623 bytes into a region of size between 32 and 63
Date: Fri, 18 Jul 2025 08:27:23 -0700
Message-ID: <20250718152724.1206447-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <202507181808.mpbc1F0r-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 18 Jul 2025 16:39:59 +0800 kernel test robot <lkp@intel.com> wrote:

>    mm/hugetlb_cgroup.c: In function 'hugetlb_cgroup_file_init':
> >> mm/hugetlb_cgroup.c:829:44: warning: '%s' directive output may be truncated writing up to 1623 bytes into a region of size between 32 and 63 [-Wformat-truncation=]
>      829 |   snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);
>          |                                            ^~
>    mm/hugetlb_cgroup.c:829:3: note: 'snprintf' output between 2 and 1656 bytes into a destination of size 64
>      829 |   snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);
>          |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    mm/hugetlb_cgroup.c:829:44: warning: '%s' directive output may be truncated writing up to 2087 bytes into a region of size between 32 and 63 [-Wformat-truncation=]
>      829 |   snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);
>          |                                            ^~
>    mm/hugetlb_cgroup.c:829:3: note: 'snprintf' output between 2 and 2120 bytes into a destination of size 64
>      829 |   snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);
>          |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In theory,

#define MAX_CFTYPE_NAME = 64
sizeof(cft->name) = MAX_CFTYPE_NAME
sizeof(buf) = 32
sizeof(tmpl->name) = MAX_CFTYPE_NAME

But in practice there should never really be an overflow, since the longest
name so far "rsvd.max_usage_in_bytes" is 23 characters long and the longest
hugepage size string is "64KB" or "32MB"...

Unless someone makes a horrendously long name, I think we should be good.
With that said, char *mem_fmt only returns strings of up to 4 characters long.
Maybe we can shrink sizeof(buf) to be 4 and explicitly truncate the last
5 bytes (account for '.') of tmpl->name? I can spin something up.

Curious what others think though. Is this fix necessary? We really should
never overflow anyways.

Thank you Kernel Test Robot!
Joshua

Sent using hkml (https://github.com/sjp38/hackermail)
