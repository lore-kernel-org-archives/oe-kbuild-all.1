Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A12EC5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 11:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1680695293; x=1712231293;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version;
  bh=vyvI49OUnAGQE/Frki4ErHvvcpnttUz3te/BYi41UXU=;
  b=IeQ3TkE/nZZHEJC/41AMOab7+1nyDrPUEd/RXy+GeMmSL7oNmCuuZtp0
   dzuSF/3xhIQJmRAHGXkoQvieJE3s+rJTpo9IBws7ZDNhGzCsI7yMQwuJU
   Ei+sADS4KsXdJayHt/dYqINtRRtT8opI/JjYbi8eATK+MhcsKfS5v5bwT
   c=;
X-IronPort-AV: E=Sophos;i="5.98,319,1673913600"; 
   d="scan'208";a="201193846"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-pdx-2c-m6i4x-d2040ec1.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 11:48:09 +0000
Received: from EX19MTAUEA002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
	by email-inbound-relay-pdx-2c-m6i4x-d2040ec1.us-west-2.amazon.com (Postfix) with ESMTPS id 652D840E6D;
	Wed,  5 Apr 2023 11:48:08 +0000 (UTC)
Received: from EX19MTAUEA001.ant.amazon.com (10.252.134.203) by
 EX19MTAUEA002.ant.amazon.com (10.252.134.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 5 Apr 2023 11:47:54 +0000
Received: from dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (10.15.11.255)
 by mail-relay.amazon.com (10.252.134.102) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 5 Apr 2023 11:47:54 +0000
Received: by dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (Postfix, from userid 23027615)
	id 0874A22BC6; Wed,  5 Apr 2023 13:47:52 +0200 (CEST)
From: Pratyush Yadav <ptyadav@amazon.de>
To: kernel test robot <lkp@intel.com>
CC: <stable@vger.kernel.org>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH 5.4] cifs/smb3: Fix NULL pointer dereference in
 smb2_query_info_compound()
References: <ZC1fJiHvpbXcysXi@ec83ac1404bb>
Date: Wed, 5 Apr 2023 13:47:52 +0200
In-Reply-To: <ZC1fJiHvpbXcysXi@ec83ac1404bb> (kernel test robot's message of
	"Wed, 5 Apr 2023 19:44:38 +0800")
Message-ID: <mafs0o7o2h7o7.fsf@amazon.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Apr 05 2023, kernel test robot wrote:

> Hi,
>
> Thanks for your patch.
>
> FYI: kernel test robot notices the stable kernel rule is not satisfied.
>
> Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'

I think the robot should also learn to look at the 'To:' header :-)

> Subject: [PATCH 5.4] cifs/smb3: Fix NULL pointer dereference in smb2_query_info_compound()
> Link: https://lore.kernel.org/stable/20230405114220.108739-1-ptyadav%40amazon.de
>
> The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
>

-- 
Regards,
Pratyush Yadav



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



