Content-Type: multipart/mixed; boundary="===============2132854145937803776=="
MIME-Version: 1.0
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH bpf-next V4 2/5] bpf: bpf_fib_lookup return MTU value as output when looked up
Date: Fri, 30 Oct 2020 15:35:21 +0100
Message-ID: <20201030153521.727bfb80@carbon>
In-Reply-To: <20201028124942.GE1042@kadam>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2132854145937803776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Oct 2020 15:49:42 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> New smatch warnings:
> net/core/filter.c:5395 bpf_ipv4_fib_lookup() error: uninitialized symbol =
'mtu'.

I will fix and send V5.

-- =

Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

--===============2132854145937803776==--

