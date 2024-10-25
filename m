Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188C6215C49
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 19:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729884071; cv=none; b=Phusi320+p1l0lMXHBIKu7Kwm4I0nT4RUMCI9cTYaLLppyYH1XKuXRsJ5g87XcBR47LH8segWW1wM2BhrwkXMEit47XJfeHI3nhz2EnkD1Jf4wVY2/sXqMo8uI2HZZ0Jqf7YY6qPLOqsKY6/vDVnTkGSRMCsPnmzJeb0ePLH1LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729884071; c=relaxed/simple;
	bh=oPo+oxrrZyyydfBeDFav/rTZR13Eds9I5xB5sezLEwc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mJy5hcJ0erp8JwKeoOdahRa312mUbmc/O4c/giZgDDH3tKkcILmL7yRgILIpO5EafOM3YoUK6EnO4pkRr/U8arXT214PMoKZWCOKSiiOcV14ekG0jH9ax71p84Ea2Y7kUcFWMN/SR1DwXfEEKAShG2bDj5P2pApVcyfLLwh/kkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M380PpHb; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M380PpHb"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e290947f6f8so4520582276.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 12:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729884069; x=1730488869; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K8NR4IYBByYjHNBssdMWQfaKh03I9jRdtJJnrSyn6yE=;
        b=M380PpHbP5G6NZ6mJypSBk22K93UAPYQWDVX8OHC2W8t7atcz92WIeGhpB2WqtWGyZ
         zZ048c8uydRgClfeS+BUMmMd+Lan6kQ2JgeiB3rEOf9UVUFpvjlzF3O0ReFb3MrXF3xa
         OCj/BUhYcxt17+mw+khXuZ9md7ZmRhSEgJuYqOOiaYxzTChxJ/8tTLtKyAeFetu5YE9N
         yipqZX5VHINsJvviJsAcxwybdU1oLvUtCxP8LdY+/EzOeokDL2Rs4OMxdelPzsjyeq6h
         HWLzgXtb2havnlUJPNO9RIlH3uVZr9CZ3U96cnK9b5emxCuHNJjY8NK0H8vLjE354E2o
         Fmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729884069; x=1730488869;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K8NR4IYBByYjHNBssdMWQfaKh03I9jRdtJJnrSyn6yE=;
        b=GlE5SM0LPs69Sx/RJ3TBD8dfw2s6EW4ieqenM+D2/1iEwxskfwehbPThoNElaqLj40
         /mNvjugf5pYAeAvS4gh9MQZWf4+rrtCIvGTSsOIDgcJjeiC5mApbzAH7/gyBTD2D/+Jj
         /luJbD0l7ciB/j12qk/gPv+hcNxt8x+I2wartgZk3adxM03kLSar6+nPD5fwYYSbXTdi
         zH8oZg4bgOC2bdJTyF0jCQJzu7Y5Kp1HswXlfiIzrZQ4mcpql67826pCkhfPnaUL4dA7
         V6ut9aoOQIr5fZSVX7oL3nUE6OJ2h10Z7y8u0lbfAe7PHcdUN3kKLYRRBk86sdk7McEN
         HvfA==
X-Forwarded-Encrypted: i=1; AJvYcCXIWLDySHaqcQLgLtMAcNSaRbh5mY+OGY/yg8H5R4zVeiwJEHkV2P1f+yTz5b5cI1Q5GcfEThN6Bzp3eJ06@lists.linux.dev
X-Gm-Message-State: AOJu0YybIHGxqhMHwBefbkBUXSatNka0KSfy5u8PC4BHWQgxbzWoGApo
	+juF4bJwwmTCLzivwXcS/B6tlZQMijHim3bTydwXXy7Ub+eLA2Yx9fLWqDRB/eEy/+jBFYVGsNb
	SvFM12b5d+Yy7x8nbQg==
X-Google-Smtp-Source: AGHT+IGwJn9EJP8GtKGgKNxrH0BY4CkxYPV45y1cD8icRFgRw9CbGp2WvYHGCQMogrHt+opwFvFH2GIGVKy8VGCv
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:13d:fb22:ac12:a84b])
 (user=jthoughton job=sendgmr) by 2002:a05:6902:3297:b0:e2e:2e79:207c with
 SMTP id 3f1490d57ef6-e3087728d56mr466276.0.1729884068955; Fri, 25 Oct 2024
 12:21:08 -0700 (PDT)
Date: Fri, 25 Oct 2024 19:21:06 +0000
In-Reply-To: <202410252141.djLwbAYF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202410252141.djLwbAYF-lkp@intel.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241025192106.957236-1-jthoughton@google.com>
Subject: [linux-next:pending-fixes 301/373] mm/vmscan.c:3498: undefined
 reference to `pmdp_test_and_clear_young'
From: James Houghton <jthoughton@google.com>
To: akpm@linux-foundation.org
Cc: lkp@intel.com, jthoughton@google.com, linux-mm@kvack.org, 
	oe-kbuild-all@lists.linux.dev, yuzhao@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

The following diff applied to the second patch[1] fixes this error. The
diff is functionally a no-op; the get_pmd_pfn() immediately following
the code here would return -1 in the !pmd_present() case.

I can send a brand new patch if you'd prefer.

[1]: https://lore.kernel.org/linux-mm/20241019012940.3656292-3-jthoughton@google.com/

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 29c098790b01..70604eef0dd3 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3486,7 +3486,10 @@ static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area
 		/* don't round down the first address */
 		addr = i ? (*first & PMD_MASK) + i * PMD_SIZE : *first;
 
-		if (pmd_present(pmd[i]) && !pmd_trans_huge(pmd[i])) {
+		if (!pmd_present(pmd[i]))
+			goto next;
+
+		if (!pmd_trans_huge(pmd[i])) {
 			if (!walk->force_scan && should_clear_pmd_young() &&
 			    !mm_has_notifiers(args->mm))
 				pmdp_test_and_clear_young(vma, addr, pmd + i);

