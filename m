Content-Type: multipart/mixed; boundary="===============1002166980266753157=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [intel-linux-intel-lts:4.19/android_r 18600/21549] drivers/usb/host/xhci-dbgcap.c:191:6: warning: no previous prototype for 'xhci_dbc_flush_requests'
Date: Thu, 14 Jan 2021 13:45:04 +0800
Message-ID: <202101141359.buVDxaiO-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1002166980266753157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_r
head:   24f0fbfa4ad1b601f92d91cfcb7f01ad4d0f6acc
commit: b88d999a5b9ae9022e12e1a5810b12b21cb77996 [18600/21549] usb: xhci: d=
bc: make DbC modular, introducing dbc_function structure
config: microblaze-randconfig-r011-20210113 (attached as .config)
compiler: microblaze-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/b88d999a5b9ae9022=
e12e1a5810b12b21cb77996
        git remote add intel-linux-intel-lts https://github.com/intel/linux=
-intel-lts.git
        git fetch --no-tags intel-linux-intel-lts 4.19/android_r
        git checkout b88d999a5b9ae9022e12e1a5810b12b21cb77996
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dmicroblaze =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/host/xhci-dbgcap.c: In function 'xhci_dbc_populate_strings':
   drivers/usb/host/xhci-dbgcap.c:50:36: warning: taking address of packed =
member of 'struct usb_string_descriptor' may result in an unaligned pointer=
 value [-Waddress-of-packed-member]
      50 |    UTF16_LITTLE_ENDIAN, (wchar_t *)s_desc->wData,
         |                                    ^~~~~~
   drivers/usb/host/xhci-dbgcap.c:61:36: warning: taking address of packed =
member of 'struct usb_string_descriptor' may result in an unaligned pointer=
 value [-Waddress-of-packed-member]
      61 |    UTF16_LITTLE_ENDIAN, (wchar_t *)s_desc->wData,
         |                                    ^~~~~~
   drivers/usb/host/xhci-dbgcap.c:73:36: warning: taking address of packed =
member of 'struct usb_string_descriptor' may result in an unaligned pointer=
 value [-Waddress-of-packed-member]
      73 |    UTF16_LITTLE_ENDIAN, (wchar_t *)s_desc->wData,
         |                                    ^~~~~~
   drivers/usb/host/xhci-dbgcap.c: At top level:
>> drivers/usb/host/xhci-dbgcap.c:191:6: warning: no previous prototype for=
 'xhci_dbc_flush_requests' [-Wmissing-prototypes]
     191 | void xhci_dbc_flush_requests(struct xhci_dbc *dbc)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-dbgcap.c: In function 'xhci_dbc_handle_events':
>> drivers/usb/host/xhci-dbgcap.c:794:8: warning: variable 'ret' set but no=
t used [-Wunused-but-set-variable]
     794 |  int   ret;
         |        ^~~
   drivers/usb/host/xhci-dbgcap.c:18: warning: cannot understand function p=
rototype: 'struct dbc_function *dbc_registered_func; '


vim +/xhci_dbc_flush_requests +191 drivers/usb/host/xhci-dbgcap.c

    40	=

    41	static u32 xhci_dbc_populate_strings(struct dbc_str_descs *strings,
    42						struct dbc_function *func)
    43	{
    44		struct usb_string_descriptor	*s_desc;
    45		u32				string_length;
    46	=

    47		/* Serial string: */
    48		s_desc =3D (struct usb_string_descriptor *)strings->serial;
    49		utf8s_to_utf16s(func->string.serial, strlen(func->string.serial),
    50				UTF16_LITTLE_ENDIAN, (wchar_t *)s_desc->wData,
    51				DBC_MAX_STRING_LENGTH);
    52	=

    53		s_desc->bLength		=3D (strlen(func->string.serial) + 1) * 2;
    54		s_desc->bDescriptorType	=3D USB_DT_STRING;
    55		string_length		=3D s_desc->bLength;
    56		string_length		<<=3D 8;
    57	=

    58		/* Product string: */
    59		s_desc =3D (struct usb_string_descriptor *)strings->product;
    60		utf8s_to_utf16s(func->string.product, strlen(func->string.product),
  > 61				UTF16_LITTLE_ENDIAN, (wchar_t *)s_desc->wData,
    62				DBC_MAX_STRING_LENGTH);
    63	=

    64		s_desc->bLength		=3D (strlen(func->string.product) + 1) * 2;
    65		s_desc->bDescriptorType	=3D USB_DT_STRING;
    66		string_length		+=3D s_desc->bLength;
    67		string_length		<<=3D 8;
    68	=

    69		/* Manufacture string: */
    70		s_desc =3D (struct usb_string_descriptor *)strings->manufacturer;
    71		utf8s_to_utf16s(func->string.manufacturer,
    72				strlen(func->string.manufacturer),
  > 73				UTF16_LITTLE_ENDIAN, (wchar_t *)s_desc->wData,
    74				DBC_MAX_STRING_LENGTH);
    75	=

    76		s_desc->bLength		=3D (strlen(func->string.manufacturer) + 1) * 2;
    77		s_desc->bDescriptorType	=3D USB_DT_STRING;
    78		string_length		+=3D s_desc->bLength;
    79		string_length		<<=3D 8;
    80	=

    81		/* String0: */
    82		strings->string0[0]	=3D 4;
    83		strings->string0[1]	=3D USB_DT_STRING;
    84		strings->string0[2]	=3D 0x09;
    85		strings->string0[3]	=3D 0x04;
    86		string_length		+=3D 4;
    87	=

    88		return string_length;
    89	}
    90	=

    91	static void xhci_dbc_init_contexts(struct xhci_hcd *xhci,
    92						struct dbc_function *func,
    93						u32 string_length)
    94	{
    95		struct xhci_dbc		*dbc;
    96		struct dbc_info_context	*info;
    97		struct xhci_ep_ctx	*ep_ctx;
    98		u32			dev_info;
    99		dma_addr_t		deq, dma;
   100		unsigned int		max_burst;
   101	=

   102		dbc =3D xhci->dbc;
   103		if (!dbc)
   104			return;
   105	=

   106		/* Populate info Context: */
   107		info			=3D (struct dbc_info_context *)dbc->ctx->bytes;
   108		dma			=3D dbc->string_dma;
   109		info->string0		=3D cpu_to_le64(dma);
   110		info->manufacturer	=3D cpu_to_le64(dma + DBC_MAX_STRING_LENGTH);
   111		info->product		=3D cpu_to_le64(dma + DBC_MAX_STRING_LENGTH * 2);
   112		info->serial		=3D cpu_to_le64(dma + DBC_MAX_STRING_LENGTH * 3);
   113		info->length		=3D cpu_to_le32(string_length);
   114	=

   115		/* Populate bulk out endpoint context: */
   116		ep_ctx			=3D dbc_bulkout_ctx(dbc);
   117		max_burst		=3D DBC_CTRL_MAXBURST(readl(&dbc->regs->control));
   118		deq			=3D dbc_bulkout_enq(dbc);
   119		ep_ctx->ep_info		=3D 0;
   120		ep_ctx->ep_info2	=3D dbc_epctx_info2(BULK_OUT_EP, 1024, max_burst);
   121		ep_ctx->deq		=3D cpu_to_le64(deq | dbc->ring_out->cycle_state);
   122	=

   123		/* Populate bulk in endpoint context: */
   124		ep_ctx			=3D dbc_bulkin_ctx(dbc);
   125		deq			=3D dbc_bulkin_enq(dbc);
   126		ep_ctx->ep_info		=3D 0;
   127		ep_ctx->ep_info2	=3D dbc_epctx_info2(BULK_IN_EP, 1024, max_burst);
   128		ep_ctx->deq		=3D cpu_to_le64(deq | dbc->ring_in->cycle_state);
   129	=

   130		/* Set DbC context and info registers: */
   131		xhci_write_64(xhci, dbc->ctx->dma, &dbc->regs->dccp);
   132	=

   133		dev_info =3D cpu_to_le32((func->vid << 16) | func->protocol);
   134		writel(dev_info, &dbc->regs->devinfo1);
   135	=

   136		dev_info =3D cpu_to_le32((func->device_rev << 16) | func->pid);
   137		writel(dev_info, &dbc->regs->devinfo2);
   138	}
   139	=

   140	static void xhci_dbc_giveback(struct dbc_request *req, int status)
   141		__releases(&dbc->lock)
   142		__acquires(&dbc->lock)
   143	{
   144		struct dbc_ep		*dep =3D req->dep;
   145		struct xhci_dbc		*dbc =3D dep->dbc;
   146		struct xhci_hcd		*xhci =3D dbc->xhci;
   147		struct device		*dev =3D xhci_to_hcd(dbc->xhci)->self.sysdev;
   148	=

   149		list_del_init(&req->list_pending);
   150		req->trb_dma =3D 0;
   151		req->trb =3D NULL;
   152	=

   153		if (req->status =3D=3D -EINPROGRESS)
   154			req->status =3D status;
   155	=

   156		trace_xhci_dbc_giveback_request(req);
   157	=

   158		dma_unmap_single(dev,
   159				 req->dma,
   160				 req->length,
   161				 dbc_ep_dma_direction(dep));
   162	=

   163		/* Give back the transfer request: */
   164		spin_unlock(&dbc->lock);
   165		req->complete(xhci, req);
   166		spin_lock(&dbc->lock);
   167	}
   168	=

   169	static void xhci_dbc_flush_single_request(struct dbc_request *req)
   170	{
   171		union xhci_trb	*trb =3D req->trb;
   172	=

   173		trb->generic.field[0]	=3D 0;
   174		trb->generic.field[1]	=3D 0;
   175		trb->generic.field[2]	=3D 0;
   176		trb->generic.field[3]	&=3D cpu_to_le32(TRB_CYCLE);
   177		trb->generic.field[3]	|=3D cpu_to_le32(TRB_TYPE(TRB_TR_NOOP));
   178	=

   179		xhci_dbc_giveback(req, -ESHUTDOWN);
   180	}
   181	=

   182	static void xhci_dbc_flush_endpoint_requests(struct dbc_ep *dep)
   183	{
   184		struct dbc_request	*req, *tmp;
   185	=

   186		list_for_each_entry_safe(req, tmp, &dep->list_pending, list_pending)
   187			xhci_dbc_flush_single_request(req);
   188	}
   189	=

   190	=

 > 191	void xhci_dbc_flush_requests(struct xhci_dbc *dbc)
   192	{
   193		xhci_dbc_flush_endpoint_requests(&dbc->eps[BULK_OUT]);
   194		xhci_dbc_flush_endpoint_requests(&dbc->eps[BULK_IN]);
   195	}
   196	EXPORT_SYMBOL_GPL(xhci_dbc_flush_requests);
   197	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1002166980266753157==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
F9BB4zS4qwxu8D9gJ/LOO1IBAA==
--===============1002166980266753157==--

