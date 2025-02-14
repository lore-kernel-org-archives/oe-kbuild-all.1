Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3792E2566D9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 15:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739545365; cv=none; b=gab9kymvM+KOe3oDII7qPqjpY3/EedlhzfIKjQKu6u6sWPqH1vctbLESG9tvzVOZrzrABc4ZURyjoVsR/bEvne3I86NrchE7T2GFF50ur3SE93aqx53RiZcPCAtntb5Fb508foESqrIJjAdYdrAty3zyVCjsxElPNB4aU0b5NSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739545365; c=relaxed/simple;
	bh=M2AdWFZSowZKSxyzGjq/UoprlB43WGCl7x/qQuT+Z/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxEr2pTNtyNyKanpBOAK3CP3qwR92YBO40geK+nckbk+SVnCn4HZrEQ8mTFGX6JGojlBuLtwKeOhUi1tqqHaS4seTcvy/EcohfDBeDERUgAVSlwpBejhC7dwdW1ydQW9yTUReEK7me+w0Vi53ciEnfN0jLSKSoDTvboQdARw1M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XGTZIOO7; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XGTZIOO7"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5ded51d31f1so3016214a12.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 07:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739545361; x=1740150161; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rN1gBf/mWgaHncz25lS93Sf5l5HPFOQDfhm85WlICA4=;
        b=XGTZIOO7rt491BbeSa9b0vXjKVU9QqbBXaS0ZL6B36leNfYST9JpT2vN26+Jk1zW2o
         sNf4nUTAUOcSEFGn1XGxTLK6vuZtsAMirQBXSRzQ5Hi7MR3y/f4nVUJ0VIQUWMuiRL/x
         9i0mNuauBjZK4hSHHV9muqNRRI0ij0OhYSWU5HmpFUNMEGE3U1hnE13XnFw8RBcohnjL
         qzqfckjxVsrE1TAUkaaSxZGlo2SKlCtg1YbKCfzMa9fG67sEFfYT/woLB5HpnHq1l2of
         4Rv768BEQBvsR9vNIy25ZWt0WM3IaQscFKd+n88ZzUBW8m9egCQrqPfPduKrsH6QtIVM
         bJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739545361; x=1740150161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rN1gBf/mWgaHncz25lS93Sf5l5HPFOQDfhm85WlICA4=;
        b=A2XruRYR4pPWkwf8pLdjB/qKAzsFI1n7Mqmfydw4Xm/beQ3NPaAdFy6qBK7C90FyA3
         n/SRYBs+kpJ0EaTAtYaHlsL5WJ1fyhJMtopvy89c63Tl0jNbe8sDT1sdfYgDWk88pZV5
         +QH8yOW90dnGpfEN/mgf5TXlL0Djyf6F0atlE0DvBhQTfyIAXdDIGwx1x8AEl1uvuYsw
         7hCp+qsuL4vj1i8FyidmFbYR5IqC4ruO0CEGSGAGnJ+zRmcziLAqPNLE17fF8waHTYPf
         LUECuclpVvqEle9QBITEYPwGWFt2zHpcq4Z//IOxZDlKjO4Oo5AtNHzi4n30G9Nr8OtA
         Qv7g==
X-Forwarded-Encrypted: i=1; AJvYcCVAebImordxYliFv7BJ6kcTza7xC5En9+KNCkWUAiNhjtXDLyH+BK/tncz5+P9/LdWpz0sZ/ZLUEax9Whrm@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh3Jdim+cnJjrBZGLb7U3GkPs/rrz5pNR2QB6lv+nUIYSB7wNE
	RGyU0NDlBi+o+ipM3nB1bX7/wy422EqYIQwlzZBoC7M0HwTDhNDDz3/K9kYZSiM=
X-Gm-Gg: ASbGnctAMQZLnbRfAlkrm3NLahH9r24czi3gMOPWbcQ+lJlDwICBsGfpmDz0+zOYbcV
	2dOj/XLiOfkUCy1UQWKm6cyoPrKKOthOeN652ayrt3XCQjwTz5TVD0kPTNB6gSMoYGoJeEa9v8A
	+6BXcVG09fMJqtZGmyMCCDPMxBOYrizrYlC5byjqysNgO+6bYddJJ4EiWpK89TLhlJKwOHv8H4L
	D/hzSGJrRnPeuTGeGQGI6la66j+LnDC44kLxV3gboJlKlGfHJl7bUauMKxDkh+rsyX+ey4YErZQ
	EaWLow0NLPwee/4vToLY
X-Google-Smtp-Source: AGHT+IFTRPVJe8Uo/fbtBUM/QHP6adG+ehpZXzG1dBG0m3OYN+ePtIDh3yC1U9YhL4jzIL0DQt25Gw==
X-Received: by 2002:a17:907:940b:b0:ab6:5210:7c8b with SMTP id a640c23a62f3a-ab7f347c1c0mr1333438866b.37.1739545360497;
        Fri, 14 Feb 2025 07:02:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aba533bdd96sm352439666b.165.2025.02.14.07.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:02:40 -0800 (PST)
Date: Fri, 14 Feb 2025 18:02:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Karan Tilak Kumar <kartilak@cisco.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	Gian Carlo Boffa <gcboffa@cisco.com>,
	Arulprabhu Ponnusamy <arulponn@cisco.com>,
	Arun Easi <aeasi@cisco.com>
Subject: Re: drivers/scsi/fnic/fdls_disc.c:263
 fdls_schedule_oxid_free_retry_work() warn: inconsistent indenting
Message-ID: <fd4d8516-5eaa-43b0-9100-2984312930f8@stanley.mountain>
References: <f1c717cf-63eb-402a-82cc-91c445055b97@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1c717cf-63eb-402a-82cc-91c445055b97@stanley.mountain>

On Fri, Feb 14, 2025 at 05:42:25PM +0300, Dan Carpenter wrote:
> 
> I guess we can't call schedule_delayed_work() without holding the
> spin_lock?  It's a strange thing.

Actually, I see now that we're just dropping the lock to avoid a sleeping
in atomic warning with the GFP_ATOMIC allocation...  I bet you could make
the code under the lock much smaller.  Just the test_and_clear_bit() stuff
basically.

regards,
dan carpenter

diff --git a/drivers/scsi/fnic/fdls_disc.c b/drivers/scsi/fnic/fdls_disc.c
index 11211c469583..ed141236a4aa 100644
--- a/drivers/scsi/fnic/fdls_disc.c
+++ b/drivers/scsi/fnic/fdls_disc.c
@@ -308,31 +308,22 @@ void fdls_schedule_oxid_free_retry_work(struct work_struct *work)
 	struct fnic *fnic = iport->fnic;
 	struct reclaim_entry_s *reclaim_entry;
 	unsigned long delay_j = msecs_to_jiffies(OXID_RECLAIM_TOV(iport));
+	unsigned long flags;
 	int idx;
 
-	spin_lock_irqsave(&fnic->fnic_lock, fnic->lock_flags);
-
 	for_each_set_bit(idx, oxid_pool->pending_schedule_free, FNIC_OXID_POOL_SZ) {
 
 		FNIC_FCS_DBG(KERN_INFO, fnic->host, fnic->fnic_num,
 			"Schedule oxid free. oxid idx: %d\n", idx);
 
-		spin_unlock_irqrestore(&fnic->fnic_lock, fnic->lock_flags);
-	reclaim_entry = (struct reclaim_entry_s *)
-	kzalloc(sizeof(struct reclaim_entry_s), GFP_KERNEL);
-		spin_lock_irqsave(&fnic->fnic_lock, fnic->lock_flags);
-
+		reclaim_entry = kzalloc(sizeof(*reclaim_entry), GFP_KERNEL);
 		if (!reclaim_entry) {
-			FNIC_FCS_DBG(KERN_WARNING, fnic->host, fnic->fnic_num,
-				"Failed to allocate memory for reclaim struct for oxid idx: 0x%x\n",
-				idx);
-
 			schedule_delayed_work(&oxid_pool->schedule_oxid_free_retry,
 				msecs_to_jiffies(SCHEDULE_OXID_FREE_RETRY_TIME));
-			spin_unlock_irqrestore(&fnic->fnic_lock, fnic->lock_flags);
 			return;
 		}
 
+		spin_lock_irqsave(&fnic->fnic_lock, flags);
 		if (test_and_clear_bit(idx, oxid_pool->pending_schedule_free)) {
 			reclaim_entry->oxid_idx = idx;
 			reclaim_entry->expires = round_jiffies(jiffies + delay_j);
@@ -342,9 +333,8 @@ void fdls_schedule_oxid_free_retry_work(struct work_struct *work)
 			/* unlikely scenario, free the allocated memory and continue */
 			kfree(reclaim_entry);
 		}
-}
-
-	spin_unlock_irqrestore(&fnic->fnic_lock, fnic->lock_flags);
+		spin_unlock_irqrestore(&fnic->fnic_lock, flags);
+	}
 }
 
 static bool fdls_is_oxid_fabric_req(uint16_t oxid)

