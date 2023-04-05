Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1612C9A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 13:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1680701607; x=1712237607;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version;
  bh=/nCF3cWNpjfPkoFelm1XdSqldIDtBYaSO/70kNsUsXc=;
  b=W1cJk5YCH9yOkGtqJMAtpG/1ya6emdWA+DNE2qW0eJ83NHApQJzxoKYf
   FnBG/aA49f5jPEzuVzNoEiLrY+LIC//ssF5PWBOehNvcTtSErijnFQRgA
   VWUgfC/Qz979DUgIMwX6T47+iMAdZYcw4pnZsCCEYfGL/ulp8YC6z7S2W
   w=;
X-IronPort-AV: E=Sophos;i="5.98,319,1673913600"; 
   d="scan'208";a="317090273"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-pdx-2b-m6i4x-189d700f.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 13:33:24 +0000
Received: from EX19MTAUEB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
	by email-inbound-relay-pdx-2b-m6i4x-189d700f.us-west-2.amazon.com (Postfix) with ESMTPS id 3E73840D56;
	Wed,  5 Apr 2023 13:33:22 +0000 (UTC)
Received: from EX19MTAUEC001.ant.amazon.com (10.252.135.222) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 5 Apr 2023 13:33:22 +0000
Received: from dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (10.15.11.255)
 by mail-relay.amazon.com (10.252.135.200) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 5 Apr 2023 13:33:21 +0000
Received: by dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (Postfix, from userid 23027615)
	id A52A620D34; Wed,  5 Apr 2023 15:33:20 +0200 (CEST)
From: Pratyush Yadav <ptyadav@amazon.de>
To: Greg KH <gregkh@linuxfoundation.org>
CC: kernel test robot <lkp@intel.com>, <stable@vger.kernel.org>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH 5.4] cifs/smb3: Fix NULL pointer dereference in
 smb2_query_info_compound()
References: <ZC1fJiHvpbXcysXi@ec83ac1404bb> <mafs0o7o2h7o7.fsf@amazon.de>
	<2023040539-cherub-flattered-bcc0@gregkh>
	<2023040528-maroon-running-0fe2@gregkh>
Date: Wed, 5 Apr 2023 15:33:20 +0200
In-Reply-To: <2023040528-maroon-running-0fe2@gregkh> (Greg KH's message of
	"Wed, 5 Apr 2023 14:26:50 +0200")
Message-ID: <mafs0jzyqh2sf.fsf_-_@amazon.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Apr 05 2023, Greg KH wrote:

> On Wed, Apr 05, 2023 at 02:26:04PM +0200, Greg KH wrote:
>> On Wed, Apr 05, 2023 at 01:47:52PM +0200, Pratyush Yadav wrote:
>> > On Wed, Apr 05 2023, kernel test robot wrote:
>> >
>> > > Hi,
>> > >
>> > > Thanks for your patch.
>> > >
>> > > FYI: kernel test robot notices the stable kernel rule is not satisfied.
>> > >
>> > > Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
>> >
>> > I think the robot should also learn to look at the 'To:' header :-)
>>
>> Nope, the robot is correct, you submitted this incorrectly.
>
> Wait, maybe, I can't tell.

My point is that it does not matter much if stable@vger.kernel.org is in
Cc or To. It gets the email regardless. In fact, that seems quite a
common practice to me [0][1]. So I'd say it would be nice if the robot
did not needlessly complain about this.

> Please send this again and provide a whole lot more detail as to why
> this is not relevant for upstream.

I went and took another look. It seems that this was also fixed in
upstream but in a slightly different way [2]. I will backport that patch
instead of this one.

[0] https://lore.kernel.org/stable/20230403140414.236685532@linuxfoundation.org/
[1] https://lore.kernel.org/stable/20230403140415.140110769@linuxfoundation.org/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=87f93d82e0952da18af4d978e7d887b4c5326c0b

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



