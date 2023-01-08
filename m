Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FB41FAA
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Jan 2023 08:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673165003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mh/YlgSMp2Vl+cOo2meKfA1MBoJKdJmd0gQtypZXfQQ=;
	b=jHGN5FWrjzMEdTGnnnZk9iIPrYDefXRcH7YDtU8E/cLrfEHCsnH6+25FoUNg+4jO5/VPnW
	CDskGxnlsoWjykkx1gNlYH5yN5T0ZAfptQW6XEH42Hv3vi5aPnZFtSatDD2rJfBqtoSLrd
	bPd0oji9q+p9rOvnzJMxhVy/7Sug46o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-Lq8UviNcMRi60RmuoYl9Hw-1; Sun, 08 Jan 2023 03:03:22 -0500
X-MC-Unique: Lq8UviNcMRi60RmuoYl9Hw-1
Received: by mail-wm1-f69.google.com with SMTP id fl12-20020a05600c0b8c00b003d96f0a7f36so3303712wmb.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 08 Jan 2023 00:03:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mh/YlgSMp2Vl+cOo2meKfA1MBoJKdJmd0gQtypZXfQQ=;
        b=zr5QQXXOgtx6Le4gugq+pjHf9YJ0Clb4lXtAE/FblgSl+MGh5wcof6rs6JHl0JCVKC
         n0sQitU1GMPH1jQNxKbIsjTD05RNtQC4HhXXQf7gGA57j/l36Kiewi7HBLrc7kwLYtgm
         2inpryJIg5Xpn+Kx1O4J24xjLZgSgArMw3teZ++8sNG7JbXYe2otpNlQcK36JOe9RleN
         BZmBxOBvgooTVeKynfXlqKUdiQctMnaYDURw4TQiTPJxEbm16GwCb7kScl3zXVXYVdnI
         TgaM86Dmn1MbqpVB1no/eGPxRd00vvl79wsoTOhq44e5ygZljOoWHs9/ySU8NZ0ZHhIy
         T3EQ==
X-Gm-Message-State: AFqh2kpvgPY/5XUb+rHP4SqlnNt+SPt+oYcHlyWmionGt5ihVtBnu4x7
	1MibCno/u81UxMdH+vmCb3RzsM27alsIbP5ZoH0oK5z4I1NqjyRoK8aSHQJfir/+oPrFFVt5kAb
	rPsVQkZ2EXQPC3YJ6BfewVwnnvA==
X-Received: by 2002:a05:600c:2d85:b0:3d0:7d89:2256 with SMTP id i5-20020a05600c2d8500b003d07d892256mr42113430wmg.13.1673165001417;
        Sun, 08 Jan 2023 00:03:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv+wBRb6s+OsVBzQKLP09XJgbAEv7WTT7Jh01wv4hOVivWxBaryBMXamAlT8TXczBI4OQhwhQ==
X-Received: by 2002:a05:600c:2d85:b0:3d0:7d89:2256 with SMTP id i5-20020a05600c2d8500b003d07d892256mr42113420wmg.13.1673165001202;
        Sun, 08 Jan 2023 00:03:21 -0800 (PST)
Received: from redhat.com ([2.52.141.223])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c339300b003cff309807esm11151272wmp.23.2023.01.08.00.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 00:03:20 -0800 (PST)
Date: Sun, 8 Jan 2023 03:03:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 1416/3037]
 drivers/vdpa/solidrun/snet_vdpa.h:193:6: warning: no previous prototype for
 'psnet_create_hwmon'
Message-ID: <20230108030227-mutt-send-email-mst@kernel.org>
References: <202301062204.7kxE888T-lkp@intel.com>
 <CAJs=3_Dv=q77=OcuGX4cyL3MhZuqn+ygSk_t+p=ApRc4CEkGGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAJs=3_Dv=q77=OcuGX4cyL3MhZuqn+ygSk_t+p=ApRc4CEkGGw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 08, 2023 at 09:35:53AM +0200, Alvaro Karsz wrote:
> I'll send a patch to fix this shortly.

best send a new version with all the fixes applied (snprintf size
thing too).

-- 
MST

