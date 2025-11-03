Received: from mail-pf1-f227.google.com (mail-pf1-f227.google.com [209.85.210.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37C0194AD7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 04:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762143716; cv=none; b=iJ/qVSXA/nboHZopgeVeiygtSIIrwfKerPBA07tGu8TXLvnxi4QV+MgXzbjj4OpsrvKkr7R5cyJF9Kaq16pbccgx31VBYAeRw1JmcvYKteep3dxA/psfB5a7IO2yGO7RLdMqBJJFPMsG2aVlHjFnI4BHHADzzCFY3CtslXlnDOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762143716; c=relaxed/simple;
	bh=xn8PfC9zQWZ3hf7aBikfe4wn/GEFN7gRLtFBe2x28l0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YroiwPxUnmqxVZDBwzpgGSv4aCoIfcdhcLoUX4abJx+dGB2JrCeQxxOKyzJYutUo/hJed3h2HeR8ikDNmSV5VSvKVQZfbQhdMksKhp+CVWv3S2gzoQyu/p+fA4rwtsm6cOkZQqkP8g0sn2mQVVdokTnMHxcyeXgI991O3pR04CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bYIMk1r6; arc=none smtp.client-ip=209.85.210.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bYIMk1r6"
Received: by mail-pf1-f227.google.com with SMTP id d2e1a72fcca58-782e93932ffso3780323b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 02 Nov 2025 20:21:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762143714; x=1762748514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pGeVkJP0vcaAX3ifIveL1ijH235A4PUrweqO7OyAiPs=;
        b=BlzmW4Rb1JQ5aM7jdAe7tlyxbCQv1w6abDLHuID0cZzkeZ0qgbXQI+e8mYz4+I+SRN
         1/ipJ4DH/MLkPjl1Su5+pVhlZZbkMOjRccl7MeDFZFL4aD5YPCPuMRKcsWEz2Iwm5G29
         8DviYzb7I7lEN9lYwzZGymGS8w97Z8JepYw6QJPxmjDOEkZWNctO92llXzXQEAsSzyPM
         GWaulF5d2DzxBJZ+a5i9TnhvIcp5JXa7os7In1+dl1vZ8Zgyh6lQFR8I+YZQtqoEfOCz
         l5dkOfWdMuaorUznMRKJi+e8ouXDoOXZDXxehjk3oC3sUmcna2e2b8ZC0X4lE4v8JnWt
         HdHA==
X-Forwarded-Encrypted: i=1; AJvYcCVDNOQmVH537hqZ65FhMRsiktD9aD2sem678MNVtT5UEBwe1dU7ODTlMNzNvBcNvTV60bGfZqrj5ynDmDis@lists.linux.dev
X-Gm-Message-State: AOJu0Yzne0VHiqwFBWIbeaJ+vcc72Mb4qcfZ6pePoq6mmnm7tcO9TV8A
	4MNpGuQz2p+5tpt0MKYdEdImNAuowMcTWzsRdzPnSzgtG6KPDc54sfT1xSb8yS3f4dk/NTL08ai
	3957L7CqfPi3IJhGAeT/jecxffSfwZcBlSDlYhxjj11ATo2/BIue39seUMACxoCGMhgjSdbGpCp
	+HbGNuyKBifIKJQvo3yBL4ssxOiJnNPag3NbuEGsLNAYd9LmFsp1jHNVVCbY4fMfH0FNVMwwAYQ
	Y9+w7cY+7PJAf0M5jKpzOX4IllmWm9tRA==
X-Gm-Gg: ASbGncs8TYwzhOm1O5ISUQ8eS89rCni8uuajh378COyD/ThodggR6JYUENV64CXdKaU
	HeK9DyLslZfMXlp2disSupyOF9W+B0yASezMdGNdUdsc+k5WZUgYnC7ncXh33vSG1MQCdfaGxdQ
	+hF/pLsglwMyiendXjkE/Dh1P3nrjczW4ZbdxFXK/HIrfc8CRRCRsTPv7ByEyV2AQYjLc8fxPfq
	gGzewKkp3RaUSz7XhgIm5AnFFZ5eRSetS9wSdDvkvOOzBe4uJr8PTKDjfy9Xx70RxL0JROAvwI9
	XlRHp/Bg6+nzDrxtkehzhi+m2n0RlYL1TJP1QSKn5eJcrdBu3xEVmQJlK3lKRY0ulgn2unJ84QE
	tIDPXcAIlcOOxAjbSnDV91kKqijZwYKz4zGKc3XeoGw35tTpKpjRS6qyqbW1fPQ+B8qiUO/5q3t
	zu8K4v55edvYza5xkNuk6i4uvFqvGXnNNYai/a48GkEojwz/a/rw==
X-Google-Smtp-Source: AGHT+IEGr4lQFduEoLnR8tS9erWKC68b5Rjl4JsJEZ3Q+tEJ1ezzJ1MPQVsyrchIYRuLMA9nIUHv8QKMajmR
X-Received: by 2002:a05:6a20:1592:b0:342:2eac:e3c0 with SMTP id adf61e73a8af0-348ca75c661mr14611331637.12.1762143714052;
        Sun, 02 Nov 2025 20:21:54 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-b93b7e1b113sm580907a12.6.2025.11.02.20.21.53
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Nov 2025 20:21:54 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-294df925293so40745545ad.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 02 Nov 2025 20:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1762143712; x=1762748512; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pGeVkJP0vcaAX3ifIveL1ijH235A4PUrweqO7OyAiPs=;
        b=bYIMk1r6MBP9E/jIUltxbI3T/om0gRVAjLbseV5PdRn3+SWUk5LnEWFwmWvjYaKZXV
         BrHQ6OV4M1ORAyHfLpAkUdr80Yj4z+Emz48l0NaQXUjN/rRYANtcr3CRussdK+xIkzxf
         3R1AJTVmBxiB5PFi2m40el44aStsktMvVkyEU=
X-Forwarded-Encrypted: i=1; AJvYcCUQzVnF4wF6TtB/fsxjs6t1BOg5vWlPWXX2pMZL3tsFmNLP6wbwfXhtfQs5FD9fRmqYLXe4o834ffHKbY4I@lists.linux.dev
X-Received: by 2002:a17:902:d505:b0:24c:965a:f94d with SMTP id d9443c01a7336-2951a486843mr161567255ad.46.1762143712193;
        Sun, 02 Nov 2025 20:21:52 -0800 (PST)
X-Received: by 2002:a17:902:d505:b0:24c:965a:f94d with SMTP id
 d9443c01a7336-2951a486843mr161567075ad.46.1762143711860; Sun, 02 Nov 2025
 20:21:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251030171540.12656-1-kalesh-anakkur.purayil@broadcom.com>
 <202510312213.Pogyd6u5-lkp@intel.com> <20251102120441.GC17533@unreal>
In-Reply-To: <20251102120441.GC17533@unreal>
From: Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>
Date: Mon, 3 Nov 2025 09:51:38 +0530
X-Gm-Features: AWmQ_bnmidPY8YGMQBQoS_ZQiDpHQQ6L3o_6aX8icLnUFPAxBijFD0D_4ruFeas
Message-ID: <CAH-L+nOm9ssp7nVPDqNZzdDkZGjKOBYxKLeExdSvHnTJRwVmeQ@mail.gmail.com>
Subject: Re: [PATCH rdma-next] RDMA/bnxt_re: Add a debugfs entry for CQE
 coalescing tuning
To: Leon Romanovsky <leon@kernel.org>
Cc: kernel test robot <lkp@intel.com>, jgg@ziepe.ca, oe-kbuild-all@lists.linux.dev, 
	linux-rdma@vger.kernel.org, andrew.gospodarek@broadcom.com, 
	selvin.xavier@broadcom.com, 
	Damodharam Ammepalli <damodharam.ammepalli@broadcom.com>, 
	Hongguang Gao <hongguang.gao@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000087a2b0642a90e73"

--000000000000087a2b0642a90e73
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ACK. I will push a V2.

On Sun, Nov 2, 2025 at 5:34=E2=80=AFPM Leon Romanovsky <leon@kernel.org> wr=
ote:
>
> On Fri, Oct 31, 2025 at 11:08:30PM +0800, kernel test robot wrote:
> > Hi Kalesh,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on rdma/for-next]
> > [also build test WARNING on linus/master v6.18-rc3 next-20251031]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Kalesh-AP/RDMA-b=
nxt_re-Add-a-debugfs-entry-for-CQE-coalescing-tuning/20251031-011453
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git f=
or-next
> > patch link:    https://lore.kernel.org/r/20251030171540.12656-1-kalesh-=
anakkur.purayil%40broadcom.com
> > patch subject: [PATCH rdma-next] RDMA/bnxt_re: Add a debugfs entry for =
CQE coalescing tuning
> > config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/202510=
31/202510312213.Pogyd6u5-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20251031/202510312213.Pogyd6u5-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202510312213.Pogyd6u5-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    In file included from drivers/infiniband/hw/bnxt_re/main.c:70:
> > >> drivers/infiniband/hw/bnxt_re/debugfs.h:37:27: warning: 'bnxt_re_cq_=
coal_str' defined but not used [-Wunused-const-variable=3D]
> >       37 | static const char * const bnxt_re_cq_coal_str[] =3D {
> >          |                           ^~~~~~~~~~~~~~~~~~~
> >
> >
> > vim +/bnxt_re_cq_coal_str +37 drivers/infiniband/hw/bnxt_re/debugfs.h
> >
> >     36
> >   > 37        static const char * const bnxt_re_cq_coal_str[] =3D {
> >     38                "buf_maxtime",
> >     39                "normal_maxbuf",
> >     40                "during_maxbuf",
> >     41                "en_ring_idle_mode",
> >     42                "enable",
> >     43        };
> >     44
>
> Right, it shouldn't be placed in header file. It needs to be in debugfs.c
>
> Thanks
>
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki



--=20
Regards,
Kalesh AP

--000000000000087a2b0642a90e73
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGtzCCBJ+g
AwIBAgIMEvVs5DNhf00RSyR0MA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYyMDEzNDI1N1oXDTI3MDYyMTEzNDI1N1owgfUxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEYMBYGA1UEBBMPQW5ha2t1ciBQdXJheWlsMQ8wDQYDVQQqEwZLYWxlc2gxFjAUBgNVBAoT
DUJST0FEQ09NIElOQy4xLDAqBgNVBAMMI2thbGVzaC1hbmFra3VyLnB1cmF5aWxAYnJvYWRjb20u
Y29tMTIwMAYJKoZIhvcNAQkBFiNrYWxlc2gtYW5ha2t1ci5wdXJheWlsQGJyb2FkY29tLmNvbTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOG5Nf+oQkB79NOTXl/T/Ixz4F6jXeF0+Qnn
3JsEcyfkKD4bFwFz3ruqhN2XmFFaK0T8gjJ3ZX5J7miihNKl0Jxo5asbWsM4wCQLdq3/+QwN/xAm
+ZAt/5BgDoPqdN61YPyPs8KNAQ8zHt8iZA0InZgmNkDcHhnOJ38cszc1S0eSlOqFa4W9TiQXDRYT
NFREznPoL3aCNNbDPWAkAc+0/X1XdV1kt4D9jrei4RoDevg15euOaij9X7stUsj+IMgzCt2Fyp7+
CeElPmNQ0YOba2ws52no4x/sT5R2k3DTPisRieErWuQNhePfW2fZFFXYv7N2LMgfMi9hiLi2Q3eO
1jMCAwEAAaOCAecwggHjMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcB
AQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQv
Z3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2ln
bi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAy
ASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNv
bS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29t
L2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwLgYDVR0RBCcwJYEja2FsZXNoLWFuYWtrdXIucHVyYXlp
bEBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAUACk2nlx6ug+v
LVAt26AjhRiwoJIwHQYDVR0OBBYEFJ/R8BNY0JEVQpirvzzFQFgflqtJMA0GCSqGSIb3DQEBCwUA
A4ICAQCLsxTSA9ERT90FGuX/UM2ZQboBpTPs7DwZPq12XIrkD58GkHWgWAYS2xL1yyvD7pEtN28N
8d4+o6IcPz7yPrfWUCCpAitaeSbu0QiZzIAZlFWNUaOXCgZmHam8Oc+Lp/+XJFrRLhNkzczcw3zT
cyViuRF/upsrQ3KY/kqimiQjR9BduvKiX/w/tMWDib1UhbVhXxuhuWMr8j8sja2/QR9fk670ViD9
amx7b5x595AulQfiDhcN0qxG4fr7L22Y/RYX8fCoBAGo0SF7IpxSukVsp6z5uZp5ggdNr2Cq88qk
if7GG/Oy1beosYD9I5S5dIRcP25oNbcJkbCb/GuvWegzGfxCCBuirb09mTSZRxaBmb1P6dANmPvh
PdqGqxfFrXagvwbO15DN46GarD9KiHa8QHyTtWghL3q+G6ZHlZUWnyS4YMacrx8Ngy0x7HR4dNdT
pqAqOOsOwDmQFBNRYomMdAaOXm6x6MFDnp51sIWVNGWK2u4le2VI6RJMzEqLzMZKL0vTW+HPqMaT
hWv2s5x6cJdLio1vP63rDxJS7vH++zMaY0Jcptrx6eAhzfcq+y/TkHJaZ4dWrtbof1yw3z5EpCvT
YDxV0XFQiCRLNKuZhkVvQ8dtmVhcpiT/mENrWKWOt0DwNEeC/3Fr1ruoyriggbnRmBQt1bC5uxfv
+CEHcDGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYt
c2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIwMjMCDBL1bOQzYX9NEUsk
dDANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgGk/uHN1pMfpNAEm63KWyp99TILQP
m2RFrVGlX+cicywwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUx
MTAzMDQyMTUyWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAPjmERYec1Sx+WHg2SIe6AeZoRD0OnW4xSqEunaDEXt5/nYS5Mp9TWtRoih6A4Hkj
BaoEIHe61X0hrt4qN6jl0AvKChhzpR2zRpempD6cA6arfcBEUWGYI1pMEMIpbIq8KW50GEdmk+sD
MWssfOmA0A7/6pHXeUpt9HS4sBhKrFYLO9QPq9lPUx+m2YIBgtVqtzEw/F/paPlhhlTaX0TRi4lg
nGhb9xIPF1JcGkcYaNVg18ZwoyyxBoNvF6ONkW/M7/LhM+3FZZwqKyyod+y60cBuClKmEKmoFY3R
WLf1aFPAqrW/zlDXbCaYRgVBwjVy/aA+F5PqFOw2lS+cT0TEcg==
--000000000000087a2b0642a90e73--
