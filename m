Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804A83603F6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779909508; cv=none; b=j9rbJEL8z4WhLMh9AlwvhZYKw5YaAAO0oFS39Ts6kgRGEcfVPtw0J3e3/CoJt5QYjfmmQjizQUD7r4OGs9zbfpTaZGOklQs4WbUkOzRQHtVncAw0tUt917xAnRVoyawGD7uuactA4bYXyL5PrzpmZGDSb0JcRnDYNsJaDYu4G3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779909508; c=relaxed/simple;
	bh=5EH1mNglS63unxFL6AsWqUJ48KrEXv+b9WWyEFILe/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEMEYXR1THSsxvM1JuuWpZOIQ4FlB6z3HwCWh/mHW8K9rAPGSJB0nyBWUb4rP8jWjcBp36ZHm9l0R0OwxwHcZAkcNDKTj/yirmh2e5I14o2LnYhtw1rpoS+jJlAW/jQY62ZslxfEsP6rFKbTtBWdABeWHou8tasOsGqk5wgiR7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kA2W+uiM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kA2W+uiM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso103158345e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 12:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779909506; x=1780514306; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UwjnU4U43V3LtGVrQg6DwBlgdYG1OSICBCjTEY60hGM=;
        b=kA2W+uiMKGWWLn8jqdcfB6r1Lxk52g8MThAYz6qVz3HbGaroFrkUU9OFwU3oxESWp4
         cQ4DS3BzqZnzUCsvZGFbMxMOVBGCahl/AeQa9fvmQemRHzEkM0wyF0dtXBSvzJHBkd7V
         wTybzYSHQPUJpY0MoeXAVqZp5L9ZDhKn7kPSgiWLRRPgaU/YxK2MDyMu0Dr2JQxEIUOj
         vzkhQCpb0+F/W2H1olnGCbWReKPhtbNnMr1ZeNnXZHL53f4mtBfPiTi2ofhJd79Edc2Z
         zxKptL/jRuuZbOX8je2nJ1MUBLSMz9NgeSQEMzII/kbs/WBBmeH/8EUWBWq78r5t3fxk
         qRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779909506; x=1780514306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwjnU4U43V3LtGVrQg6DwBlgdYG1OSICBCjTEY60hGM=;
        b=JIoL1YydAs3dnG97vBddGXAlZkyEhujSlAKO0S3HX9SnsT1Gl4UHBbBbKpxC3aUQ9z
         4Rz52Jk37ISzrXI/n3epi7PQkkQdgMFp0TFr/d1W/RpaPIKORCbKGnEFoczaUHjUHYKo
         gV1hXNAgtOBgeJfjqv7BTYMq1M3IZmDcP/Ni52YYAQBqNohLaBnU4rSBrXipLwLocmHV
         7iXRBZKsqBNBIE2yLNyWONhYvrG1ilsk9y27nyUDkDnQiMaJTm8b5ewbV0kASPYduMYI
         CYYl7GOm57Dyx8AKmemcx30mXuLJm8D6j0Df+ykcWSgYq281Q05CQ8iowDBmABeTX7vF
         qreg==
X-Forwarded-Encrypted: i=1; AFNElJ9j0qF2DpSzHss9NsthkDd7rTQeKLNw9ifgc9XdPqPfTI/DNV0hQnCm2IP7TQm9q30b+f6oAgkQvc+kyTZt@lists.linux.dev
X-Gm-Message-State: AOJu0Yyb/ykw+xmcyF5fW2gdLQ93/hYvVluKqC16Wzny1di6Lwbf/dWN
	wmMSeLggj8BYgo0/2Q+4GAFEvGzujaRFtfmOl5crRmKoZyaKnpLtmZSp
X-Gm-Gg: Acq92OGXJ2rNL2rYYyTXgd+yNJuupj5NGrHb9lJYZAqgoEh+lW2FKPblaYhFYU+b6ns
	B4wbErV7Yri/OA19amKLwAhWkp3x00B2qVmh5oNSfZNlqupkRJe11tI7GFGSwhCAe5lkW7MnMUW
	3BLU8JwsXYuP3EL92vVtAu4zEtMKk/UpGZ9FuN1cnKni9JFyfs5yYY8HRTeuK/idnagUeCRlheH
	USLKJft7+HZlnlMGtyxHS+85yEOeein/raPavu0awbL9G6QseoAsJI9atD888EjUQgDRvfn8uVV
	nMgSLkTFII7fchKZre0z/RDUXbnUhLZ83JczgXcHMeY6kOTSpud1mlp5GRl41cynLpZFOUyuxAY
	27iNim8axoEFQHAvvc/wEA4FHP1IBFRYnt9545oZeCV2hep0AsTE4oQfMr3GvgM/6Fh+6SUCugY
	PeUKo5iEFvtthGvLfhSQYAyDCy2o5gz/4ODw==
X-Received: by 2002:a05:600c:4510:b0:48a:58ae:9938 with SMTP id 5b1f17b1804b1-490426c53d8mr370565445e9.19.1779909505811;
        Wed, 27 May 2026 12:18:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908b583032sm1583215e9.18.2026.05.27.12.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 12:18:24 -0700 (PDT)
Date: Wed, 27 May 2026 22:18:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Dave Penkler <dpenkler@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: drivers/gpib/ines/ines_gpib.c:917 ines_isa_attach() warn:
 'config->ibbase' from __request_region() not released on lines: 913.
Message-ID: <ahdDfc7QdDYAXbf9@stanley.mountain>
References: <202605271229.d8wGTffx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605271229.d8wGTffx-lkp@intel.com>

Huh, Tony Btw fixed this before I reported it...  No
ines_generic_attach() cleanup, though?

I still got a Reported-by tag so that's what counts.

regards,
dan carpenter

