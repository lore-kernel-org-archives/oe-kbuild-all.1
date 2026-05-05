Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C1B426EBA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 13:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986071; cv=none; b=AK90plyMx+0BUGM7FvDhSIEMnkIdCj65TWQNt25vjCJNlThNCfhm6c6I8hTJgurLp07+3UlwYH3YzfRIAQDQeIwt5vuGzytuA+OBZ/UvdoM0OSGPVFhV3+YBgHBQYOV1fKhi3JgSgajedirGeGOSD4mdc3khcG2lDmZ4zGXiFZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986071; c=relaxed/simple;
	bh=GYtI7bDD+MMFGyL+yGGnqCAyzGu+/x6qxQ2tUmlG8HE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFCFvr1yJmxl9N3p2c5av+QU5ltCZDGunUGDfnPtzMu5pJ4vC+BXLABMoeX0RmSKH0CImlizTsqQ2O8jvlaPhoF3UwHyAAUGASFzHgK77jDDr6OrKo0KVGvM2WweyY1o1ONO/xO7kTBGRAb3rjPi7CiNEOk+8a4IM8J9YG+W7sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g76xnqk2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g76xnqk2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777986069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ify9Bi6CHKsDFsBeOr/60tpIhk/Zdvw/emSfXb/I8Gw=;
	b=g76xnqk2FWS69wJKwh+NDSU40xkuc+/K7TnKntpCly7vTX5T8jZ3ZNmLH9RWjwHrTgii4n
	3Zrd2gVg94HTbmjBLEXQ/LRVUtV1iWVQ8sRRf5uvsgMQVmSNwI2uUh/PmIMpD7jGNlFo0A
	844eRU/8XuAPQuoE9qz6wb98DklWKmk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-faa7UM9SNo61elJkMRxyRw-1; Tue, 05 May 2026 09:01:05 -0400
X-MC-Unique: faa7UM9SNo61elJkMRxyRw-1
X-Mimecast-MFC-AGG-ID: faa7UM9SNo61elJkMRxyRw_1777986064
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4837bfcfe0dso66766055e9.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 05 May 2026 06:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986064; x=1778590864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ify9Bi6CHKsDFsBeOr/60tpIhk/Zdvw/emSfXb/I8Gw=;
        b=Kx44z6W83L6SPmIjMBvUq0BmQhd7Y9+y7ViZPMYUF0hQAZ2cfFwIip0/YFE7rhe2yr
         rhvCxZP5sUpM6yIrEHvO+VwXIupBJ0JkTl9Igfsycfv6FFNnez+i9mX47xEqosrZCo1k
         jk0iR8Kl1Yq5fxjgPTORQZ84UsLN8McYChmgooD1smQweqZaY0+wZjQ9OICEekVc2mxJ
         IxJmuCsTCEq2GzlmHy6BPB+O1GCrmsfyssugs8HxflDdb0+lWV7GPsyu6mhlvZfcEGm/
         TJORqXDhVob2X/CRpJq2Ao76j8EVFYRXa+I4DGaEgti5lV7VexkRRBcD0t0EKov4fdT+
         jnsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gAeQRSKkvkzl0UODoLvnNcjCz428zQOaXfXsZh89l9iwNMKFS/sKGd+hUpfwRtuwQm0NUlk8M5MNjimfI@lists.linux.dev
X-Gm-Message-State: AOJu0YycI7gSXAgHjkKC+SgyI96q/p4wyfkFd7iz2cSMrekpj2v42BBc
	oE6CD+CDWgRkjOJ4Ix5AGQkp0RYzsZqFs/redSFDtRRFNWJhLfI7TFmEx/iLmkK4hAfPeiFMVkd
	+qfp+bniwTqiWmsEtiugWu0WEnBQQvAnkJy6NPaZwoDBS5YTJxu+xkwPT9RnN+/V6Umg=
X-Gm-Gg: AeBDietceUJwfcbG1z6PCW2uWRwJAXUnvI1tVAsS5PX9l2/Ij+/kcYJmt0katIVxTFI
	WVj/5GyQi2BBw2bwILnZzFKwWT1mtaoQVb/R1Ue0d34zK4XvS2q6OlQI85XjeNh1Dm9aT3EabBT
	3QikN8f80WKbhl8N7lEveBIhUvsqPW11woNW6niPG8cpq0sRM013MJL85FNRIGqV0VAPAm1f90p
	foKM/HdWb0sIYf+f9yib+zJe0Pk0tYsIcBnIvU9gcA+s7mcNkdShbzpp/MmshoiqqzI6IOkUfAl
	x3lmVvKC1CmaSEgwWChNFc2gLJh2DLlpLXJ2r2hzatyCCBgahR7TRYgHsPCHX0VmOnBkg6qun/A
	n2OlyZWmD1Llio5pmi/scEr8OoL54JvmMFEwqZBKNLmEZ+fq9WewpWgWWooXdsxtFdRs=
X-Received: by 2002:a05:600c:c16a:b0:489:1cda:bbb7 with SMTP id 5b1f17b1804b1-48d18ceb33dmr49000185e9.25.1777986064094;
        Tue, 05 May 2026 06:01:04 -0700 (PDT)
X-Received: by 2002:a05:600c:c16a:b0:489:1cda:bbb7 with SMTP id 5b1f17b1804b1-48d18ceb33dmr48999545e9.25.1777986063581;
        Tue, 05 May 2026 06:01:03 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.155.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c8556sm391720155e9.4.2026.05.05.06.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 06:01:03 -0700 (PDT)
Message-ID: <be3bc819-b695-4626-a1e3-a9f791d59001@redhat.com>
Date: Tue, 5 May 2026 15:01:01 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] tipc: fix UAF race in
 tipc_mon_peer_up/down/remove_peer vs bearer teardown
To: SnailSploit | Kai Aizen <kai.aizen.dev@gmail.com>, netdev@vger.kernel.org
Cc: stable@vger.kernel.org, jmaloy@redhat.com, ying.xue@windriver.com,
 kuba@kernel.org, tipc-discussion@lists.sourceforge.net,
 tung.q.nguyen@dektech.com.au, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 syzkaller-bugs@googlegroups.com,
 SnailSploit | Kai Aizen <95986478+SnailSploit@users.noreply.github.com>,
 syzbot ci <syzbot+ci779e8ed86620f383@syzkaller.appspotmail.com>
References: <CALynFi5d0DuGW50xq7xQnsDPdEuN5jBGTqh8bcsUwxk6L-FAdA@mail.gmail.com>
 <80ae67e96de2f702028e5bacc89db4575e1531ca.1777559945.git.kai.aizen.dev@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <80ae67e96de2f702028e5bacc89db4575e1531ca.1777559945.git.kai.aizen.dev@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mmKrYxXWlJJg-syOu6yWhO8hHQXIK_N9ycsqfFr1ZWw_1777986064
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/30/26 5:26 PM, SnailSploit | Kai Aizen wrote:
> @@ -422,9 +422,12 @@ static bool tipc_mon_add_peer(struct tipc_monitor *mon, u32 addr,
>  void tipc_mon_peer_up(struct net *net, u32 addr, int bearer_id)
>  {
>  	struct tipc_monitor *mon = tipc_monitor(net, bearer_id);
> -	struct tipc_peer *self = get_self(net, bearer_id);
> +	struct tipc_peer *self;
>  	struct tipc_peer *peer, *head;

Minor nit: please respect the reverse christmas tree order above.

>  
> +	if (!mon)
> +		return;

Also an empty line here (and other similar places in the patch) will
make the code more readable.
> @@ -663,7 +666,7 @@ int tipc_mon_create(struct net *net, int bearer_id)
>  		kfree(dom);
>  		return -ENOMEM;
>  	}
> -	tn->monitors[bearer_id] = mon;
> +	rcu_assign_pointer(tn->monitors[bearer_id], mon);
>  	rwlock_init(&mon->lock);
>  	mon->net = net;
>  	mon->peer_cnt = 1;

Sashiko says:

Does rcu_assign_pointer() publish the mon object before its lock
and fields are fully initialized?
Since rcu_assign_pointer() provides a release barrier, a concurrent
lockless RCU reader (like tipc_mon_peer_up()) could observe the new
mon pointer and attempt to acquire write_lock_bh(&mon->lock) before
rwlock_init(&mon->lock) has executed, or dereference a still-NULL
mon->self.
Should the publication step be moved to the absolute end of the
initialization sequence?

Note that sashiko has more remarks, even if they looks like pre-existing
issues to me.

/P

