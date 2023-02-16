Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B108BFC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 17:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676568876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EgF7DOl7V8ylK16O4PCdIIl9XiM5kM8q4lVhSqxVNYw=;
	b=QNP1v3xmT/PvPUUudQ9YJr9yX0a1j0sLJ7qsHzZFsTyBcSxQ3GSG9CsGZUjFenkyk9ujTj
	q2uypdfP4R3ifWjpVgG18ySAiVzi415/yq+qdJamoHn1T98OHHdjYgJVrRDc6ZAMQ6NyNy
	rGpbaLNJm1dTTTTtVc1E7LX3qDH3W4I=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-46-rJQYLcQeN8ulbAEiklClQQ-1; Thu, 16 Feb 2023 12:34:35 -0500
X-MC-Unique: rJQYLcQeN8ulbAEiklClQQ-1
Received: by mail-qt1-f197.google.com with SMTP id s4-20020ac85284000000b003b849aa2cd6so1592807qtn.15
        for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 09:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EgF7DOl7V8ylK16O4PCdIIl9XiM5kM8q4lVhSqxVNYw=;
        b=X6SI6ZJzKXoRYUek7imZTcvMQrqzOIsU+gBqP3qerey2dnmEomzIhQWhqy+z9VHCGK
         qLhEUiOEuAL2+8AhpY++8bglqdwVmCLyfkPZXXAuIdrh3jNCs3QbW9MKPBI/1fle9tCu
         7Q3SjDiqEJk4Upovkp0sKpFgG+IIBbQk66kQGwRETH84rMguO/k6H75bt7IruDLo+KLX
         aVbcdeEM1rsC5nIHb1mAhFQbdC9hboEsHnhcKNuMXb+1/NHmShhI7y8hMsmOCNCG1ri4
         tKiNB/PGhYNTiJkD1AdZs/SiPn1B3k7MsdlYs1BG05/SgXs/S0qpGn39e0hk0dw06JiJ
         aLrQ==
X-Gm-Message-State: AO0yUKWBslJy2+xUfFOUT0oWkH4MfjeSbA9c1q8YKPp9SGgERbSP0w6x
	efrjRXAhd+TFjoT9obiUVPNJ+gtcxj02uxsqZdT9dpMQCSYOBr8ZqmqECSi+cz6p+3XtLz99K+d
	xO2+Z5/BXEkjGgv0/JoJ6OTtw5w==
X-Received: by 2002:a05:622a:1897:b0:3b8:6d5a:3457 with SMTP id v23-20020a05622a189700b003b86d5a3457mr12358590qtc.6.1676568874292;
        Thu, 16 Feb 2023 09:34:34 -0800 (PST)
X-Google-Smtp-Source: AK7set8hjUW5nlxcsnRidy2m+rttCluDyrsDLMX7f5LMdxWpu+WvYhj9oHGJQ3/UtdXDCFBK+iFwkQ==
X-Received: by 2002:a05:622a:1897:b0:3b8:6d5a:3457 with SMTP id v23-20020a05622a189700b003b86d5a3457mr12358559qtc.6.1676568874027;
        Thu, 16 Feb 2023 09:34:34 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-121-8.dyn.eolo.it. [146.241.121.8])
        by smtp.gmail.com with ESMTPSA id k1-20020ac80201000000b003b0766cd169sm1625330qtg.2.2023.02.16.09.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 09:34:33 -0800 (PST)
Message-ID: <ea3b86d9f06af4a9261d7c698c7b9a4e1ca35ccd.camel@redhat.com>
Subject: Re: [ammarfaizi2-block:netdev/net-next/master 27/39]
 drivers/net/ethernet/sfc/efx_devlink.c:185:58: error: expected ')' before
 'build_id'
From: Paolo Abeni <pabeni@redhat.com>
To: Alejandro Lucero <alejandro.lucero-palau@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>, 
	GNU/Weeb Mailing List
	 <gwml@vger.gnuweeb.org>, Jiri Pirko <jiri@nvidia.com>, kernel test robot
	 <lkp@intel.com>
Date: Thu, 16 Feb 2023 18:34:30 +0100
In-Reply-To: <202302170047.EjCPizu3-lkp@intel.com>
References: <202302170047.EjCPizu3-lkp@intel.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2023-02-17 at 00:12 +0800, kernel test robot wrote:
> If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> > Link: https://lore.kernel.org/oe-kbuild-all/202302170047.EjCPizu3-lkp@i=
ntel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    drivers/net/ethernet/sfc/efx_devlink.c: In function 'efx_devlink_info_=
running_v2':
> > > drivers/net/ethernet/sfc/efx_devlink.c:185:58: error: expected ')' be=
fore 'build_id'
>      185 |                 memset(&build_date, 0, sizeof(build_date)
>          |                       ~                                  ^
>          |                                                          )
>      186 | #endif
>      187 |                 build_id =3D MCDI_DWORD(outbuf, GET_VERSION_V2=
_OUT_SUCFW_CHIP_ID);
>          |                 ~~~~~~~~                                 =20
> > > drivers/net/ethernet/sfc/efx_devlink.c:197:55: error: expected ';' be=
fore '}' token
>      197 |                                                  buf);
>          |                                                       ^
>          |                                                       ;
>      198 |         }
>          |         ~                                             =20

Alejandro, the bottom line is that your series need a follow-up as it
breaks the build when CONFIG_RTC_LIB is not defined. I missed that at
code review time.

Could you please sent a fix (for net-next?)

Thanks!

Paolo

