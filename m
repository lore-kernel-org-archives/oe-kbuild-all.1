Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDA036E473
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 23:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776814833; cv=none; b=piyCAPgwm1lDd8K4czF9vAyvyobmmFZrR0x0KAWtHt+qTswd0VUyauGZK1uC76MpSz5be3rFFHfJNmZ/F4Ofwgp6OLaES8+30/IRGowWwVI2PdZPN7S9oKdwT7LitTqdIDE2PZpKhf/lgHi2vz2KuMrS0BFO8AyYSH0tuuzscPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776814833; c=relaxed/simple;
	bh=FAjd0SGYlTGbrBuZkkUHlFzHmjvnupkiWc5/sWK4Frc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SifaiU5rHPbURed//HuafqN5bYkEx5sd6oBsenNABiTgql3vT9kxF7oq4eeytK0PMoRmYEj+EQhwRL6ZIsuARi9npwajN/n7x6mJBy5Lt5WSQGGKlhXiwu/VjCzMtBa/J0PDCkONBlq2AVnV9j94208QJoXdv99E0GWZ+QfoNI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=riTAqoRZ; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="riTAqoRZ"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8b038a00370so34899826d6.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 16:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776814831; x=1777419631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHYPowIO/Ty/lLtBU9hns/rmbNm5oK+oGzhuJOxaFBs=;
        b=riTAqoRZk902zocEXYw7Xps18kS+mDRQk9GwEhFwdf/sfeOPO4wgPz58JYsnqL5oyk
         fU2W+10q6U9OZuZaBhw9/TZz92u9vuDnRkX2bLADeQLIY2eJ6Jvw6INFnOBHsi7/OhDY
         vjAQXyuPPJgL2X1+r0Kw/9nQNM6nvCtFJVFfRbeuvU2gNAgpsmYhdPN6XSR2KwvcHA0P
         zw4Z9I/KqV0MW/cFe1cXRae9xqdrZNM6IEDyXKAz/HtpeXXROlu0jyWuLY1Rk5JYPXUb
         yed6yH345Ge0shwvSa+c3YmQn8LLWTJvgatPj7LyFwz/yzr1EWnXGo5NCIn73Crem9Vg
         2bMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776814831; x=1777419631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WHYPowIO/Ty/lLtBU9hns/rmbNm5oK+oGzhuJOxaFBs=;
        b=SvNal96P5yxo4pyDvTRnvpE1DH7n7hiFRJmlLEdGEYAfvfIGViI7bmHtC99fKwXrKO
         wVcgIPujdtZmwHXQPpAdg+Dlp+QC7GYj+RJqKC+DQjBryfZAQC+dU1UETRaG0iRGqPeW
         3sqsGdkypuaXOum+AZNeVxcGM7q7PoBUHAyz8X5yQttYBawA7R1AJWelI9KqjmVRmzNx
         uzQVAWGN35ZBY5T7AbhI+Wt++yvXbm7//ghE9H1eMTYmIKtXbQOUlxIuz44qmmOXG5T1
         TVKpLTmuaSC2VTajJf4uKDIl8SVK2gQBPfF0KrGbKWthY1hAQiNMkrAGWWsSRSHIHjoL
         IcPw==
X-Forwarded-Encrypted: i=1; AFNElJ8jJPsZyNQCUN17GZpg1m7HsEkAuc6qlZ39Dq3MmKKZLcVX1xdeKF7nAuWYokFxRcJ4dUMAlUSSp8XJ8jSK@lists.linux.dev
X-Gm-Message-State: AOJu0YzHkRRgr3n418mFKrIBQjmsl48PmU+GWjObHVukjVcv+z8dtE+9
	MG19LGcxUyg1ecPXd9QdkZ0GKpb+SZB2GsSe3sB+o1gjvL0xDCTD3MyQ
X-Gm-Gg: AeBDiesKkd0L29V+bY4G+CzhDPOJydbwrdIGXeALP30OThhsY4AEbtq4/oinJSMhs2j
	R39Zfauc1VMkVOla+zNJi5OuroiMiPjtghyvOFBDPCk4wQJUdiEQjUk/n0X+GgRHZekeBpSMzMD
	VXBGpBPx3fyF9wPBcMmGKPIW3FKfuX7U7+UnWbuRWDijRPrNVjb2VFDi4XvYFfUorUsRU8LOdh0
	pMWFWIROXbWqeLs70Omd+QPvJhDBAAL6IoZjxNnx9LR47sJjZ6AfOQ9uaCkqyMDL2AxbO3cTlg5
	fnovANZFIp/+0/8eEdArj1UBk8CTk49yfslq/bl0zc66HBpx+dxYkgHiJZa0wO2/P0H2qNxvOI9
	sZPoTyBs/k+sX+2ImykQHa1Ks9sG8B9Vy3168dYMr8M1+5XYnRGZ3Q38EgWqsVlDOscS7/tCbdt
	TQHxcvuQxOgc8rCUC6M5/3EFPXvO/Qmx04Kmi4zLYqvJqYB/B9aVLI4qPmx6w0+VIH5nEFM3BpU
	wMW73j1s9Huc36b39Ex5/XDQwTei1o=
X-Received: by 2002:a05:6214:2f03:b0:8ac:af0d:c101 with SMTP id 6a1803df08f44-8b027fd9d3fmr313865016d6.10.1776814831016;
        Tue, 21 Apr 2026 16:40:31 -0700 (PDT)
Received: from server0 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae86947sm152590596d6.37.2026.04.21.16.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 16:40:30 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Steve French <sfrench@samba.org>
Cc: Steve French <stfrench@microsoft.com>,
	Paulo Alcantara <pc@manguebit.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH] smb: client: scope end_of_dacl to CIFS_DEBUG2 use in parse_dacl
Date: Tue, 21 Apr 2026 19:40:22 -0400
Message-ID: <20260421234022.4144209-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <202604220046.tGkRxVtS-lkp@intel.com>
References: <202604220046.tGkRxVtS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After validate_dacl() was factored out in commit 149822e5541c, the
local end_of_dacl in parse_dacl() is only read by the dump_ace()
call under #ifdef CONFIG_CIFS_DEBUG2.  With CIFS_DEBUG2 off the
variable is assigned but never used, which gcc -W=1 flags as
-Wunused-but-set-variable.

Remove the local and compute the end-of-dacl pointer inline at the
single call site inside the existing CIFS_DEBUG2 guard.  No
functional change: when CIFS_DEBUG2 is enabled the argument value
is identical to what the removed local carried; when CIFS_DEBUG2
is disabled the code was already dead.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604220046.tGkRxVtS-lkp@intel.com/
Fixes: 149822e5541c ("smb: client: validate the whole DACL before rewriting it in cifsacl")
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-7
---
 fs/smb/client/cifsacl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/smb/client/cifsacl.c b/fs/smb/client/cifsacl.c
index 4ec204d2c774..ec5d47779304 100644
--- a/fs/smb/client/cifsacl.c
+++ b/fs/smb/client/cifsacl.c
@@ -836,7 +836,7 @@ static void parse_dacl(struct smb_acl *pdacl, char *end_of_acl,
 	int i;
 	u16 num_aces = 0;
 	int acl_size;
-	char *acl_base, *end_of_dacl;
+	char *acl_base;
 	struct smb_ace **ppace;
 
 	/* BB need to add parm so we can store the SID BB */
@@ -860,7 +860,6 @@ static void parse_dacl(struct smb_acl *pdacl, char *end_of_acl,
 	   user/group/other have no permissions */
 	fattr->cf_mode &= ~(0777);
 
-	end_of_dacl = (char *)pdacl + le16_to_cpu(pdacl->size);
 	acl_base = (char *)pdacl;
 	acl_size = sizeof(struct smb_acl);
 
@@ -876,7 +875,8 @@ static void parse_dacl(struct smb_acl *pdacl, char *end_of_acl,
 			ppace[i] = (struct smb_ace *) (acl_base + acl_size);
 
 #ifdef CONFIG_CIFS_DEBUG2
-			dump_ace(ppace[i], end_of_dacl);
+			dump_ace(ppace[i],
+				 (char *)pdacl + le16_to_cpu(pdacl->size));
 #endif
 			if (mode_from_special_sid &&
 			    ppace[i]->sid.num_subauth >= 3 &&
-- 
2.53.0

