Content-Type: multipart/mixed; boundary="===============6154335823888823923=="
MIME-Version: 1.0
From: Martin K. Petersen <martin.petersen@oracle.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-nvme:nvme-5.8 26/33] io-cmd-bdev.c:undefined reference to `t10_pi_type1_crc'
Date: Thu, 21 May 2020 15:55:03 -0400
Message-ID: <yq18shlqd0y.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <20200521194702.GA23114@lst.de>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6154335823888823923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Christoph,

> Ok, looks like the previous fix wasn't enough.  It seems like we
> need to fold this in, similar to sd and the nvme host driver:

Looks good.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- =

Martin K. Petersen	Oracle Linux Engineering
--===============6154335823888823923==--

