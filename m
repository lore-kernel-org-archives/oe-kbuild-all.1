Content-Type: multipart/mixed; boundary="===============3253272020905316506=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [matwey:fix/pwc_dma_2 1/1] include/linux/usb/hcd.h:86:18: error: field 'self' has incomplete type
Date: Fri, 08 Jan 2021 23:58:38 +0800
Message-ID: <202101082318.eVLjIpcM-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3253272020905316506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/matwey/linux fix/pwc_dma_2
head:   528fe9578749276cf53d09dedfcfb799211e5ce2
commit: 528fe9578749276cf53d09dedfcfb799211e5ce2 [1/1] media: pwc: convert =
to dma_alloc_noncoherent
config: x86_64-randconfig-s022-20210108 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-208-g46a52ca4-dirty
        # https://github.com/matwey/linux/commit/528fe9578749276cf53d09dedf=
cfb799211e5ce2
        git remote add matwey https://github.com/matwey/linux
        git fetch --no-tags matwey fix/pwc_dma_2
        git checkout 528fe9578749276cf53d09dedfcfb799211e5ce2
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from drivers/media/usb/pwc/pwc-if.c:57:
>> include/linux/usb/hcd.h:86:18: error: field 'self' has incomplete type
      86 |  struct usb_bus  self;  /* hcd is-a bus */
         |                  ^~~~
   In file included from <command-line>:
   include/linux/usb/hcd.h: In function 'bus_to_hcd':
>> include/linux/kernel.h:694:32: error: dereferencing pointer to incomplet=
e type 'struct usb_bus'
     694 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                                ^~~~~~
   include/linux/compiler_types.h:306:9: note: in definition of macro '__co=
mpiletime_assert'
     306 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:326:2: note: in expansion of macro '_comp=
iletime_assert'
     326 |  _compiletime_assert(condition, msg, __compiletime_assert_, __CO=
UNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletim=
e_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:694:2: note: in expansion of macro 'BUILD_BUG_ON_=
MSG'
     694 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |  ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:694:20: note: in expansion of macro '__same_type'
     694 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                    ^~~~~~~~~~~
   include/linux/usb/hcd.h:243:9: note: in expansion of macro 'container_of'
     243 |  return container_of(bus, struct usb_hcd, self);
         |         ^~~~~~~~~~~~
   In file included from drivers/media/usb/pwc/pwc-if.c:57:
   include/linux/usb/hcd.h: At top level:
>> include/linux/usb/hcd.h:341:44: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     341 |  int (*alloc_dev)(struct usb_hcd *, struct usb_device *);
         |                                            ^~~~~~~~~~
   include/linux/usb/hcd.h:343:44: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     343 |  void (*free_dev)(struct usb_hcd *, struct usb_device *);
         |                                            ^~~~~~~~~~
   include/linux/usb/hcd.h:345:51: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     345 |  int (*alloc_streams)(struct usb_hcd *hcd, struct usb_device *ud=
ev,
         |                                                   ^~~~~~~~~~
   include/linux/usb/hcd.h:351:50: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     351 |  int (*free_streams)(struct usb_hcd *hcd, struct usb_device *ude=
v,
         |                                                  ^~~~~~~~~~
   include/linux/usb/hcd.h:366:47: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     366 |  int (*add_endpoint)(struct usb_hcd *, struct usb_device *,
         |                                               ^~~~~~~~~~
   include/linux/usb/hcd.h:369:48: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     369 |  int (*drop_endpoint)(struct usb_hcd *, struct usb_device *,
         |                                                ^~~~~~~~~~
   include/linux/usb/hcd.h:376:50: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     376 |  int (*check_bandwidth)(struct usb_hcd *, struct usb_device *);
         |                                                  ^~~~~~~~~~
   include/linux/usb/hcd.h:384:51: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     384 |  void (*reset_bandwidth)(struct usb_hcd *, struct usb_device *);
         |                                                   ^~~~~~~~~~
   include/linux/usb/hcd.h:386:49: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     386 |  int (*address_device)(struct usb_hcd *, struct usb_device *udev=
);
         |                                                 ^~~~~~~~~~
   include/linux/usb/hcd.h:388:48: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     388 |  int (*enable_device)(struct usb_hcd *, struct usb_device *udev);
         |                                                ^~~~~~~~~~
>> include/linux/usb/hcd.h:393:11: warning: 'struct usb_tt' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
     393 |    struct usb_tt *tt, gfp_t mem_flags);
         |           ^~~~~~
   include/linux/usb/hcd.h:392:52: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     392 |  int (*update_hub_device)(struct usb_hcd *, struct usb_device *h=
dev,
         |                                                    ^~~~~~~~~~
   include/linux/usb/hcd.h:394:47: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     394 |  int (*reset_device)(struct usb_hcd *, struct usb_device *);
         |                                               ^~~~~~~~~~
   include/linux/usb/hcd.h:398:48: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     398 |  int (*update_device)(struct usb_hcd *, struct usb_device *);
         |                                                ^~~~~~~~~~
   include/linux/usb/hcd.h:399:50: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     399 |  int (*set_usb2_hw_lpm)(struct usb_hcd *, struct usb_device *, i=
nt);
         |                                                  ^~~~~~~~~~
>> include/linux/usb/hcd.h:403:30: warning: 'enum usb3_link_state' declared=
 inside parameter list will not be visible outside of this definition or de=
claration
     403 |    struct usb_device *, enum usb3_link_state state);
         |                              ^~~~~~~~~~~~~~~
   include/linux/usb/hcd.h:403:11: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     403 |    struct usb_device *, enum usb3_link_state state);
         |           ^~~~~~~~~~
   include/linux/usb/hcd.h:408:30: warning: 'enum usb3_link_state' declared=
 inside parameter list will not be visible outside of this definition or de=
claration
     408 |    struct usb_device *, enum usb3_link_state state);
         |                              ^~~~~~~~~~~~~~~
   include/linux/usb/hcd.h:408:11: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     408 |    struct usb_device *, enum usb3_link_state state);
         |           ^~~~~~~~~~
   include/linux/usb/hcd.h:444:43: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     444 | extern void usb_hcd_flush_endpoint(struct usb_device *udev,
         |                                           ^~~~~~~~~~
   include/linux/usb/hcd.h:446:45: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     446 | extern void usb_hcd_disable_endpoint(struct usb_device *udev,
         |                                             ^~~~~~~~~~
   include/linux/usb/hcd.h:448:43: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     448 | extern void usb_hcd_reset_endpoint(struct usb_device *udev,
         |                                           ^~~~~~~~~~
   include/linux/usb/hcd.h:450:48: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     450 | extern void usb_hcd_synchronize_unlinks(struct usb_device *udev);
         |                                                ^~~~~~~~~~
>> include/linux/usb/hcd.h:453:10: warning: 'struct usb_host_interface' dec=
lared inside parameter list will not be visible outside of this definition =
or declaration
     453 |   struct usb_host_interface *old_alt,
         |          ^~~~~~~~~~~~~~~~~~
>> include/linux/usb/hcd.h:452:10: warning: 'struct usb_host_config' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
     452 |   struct usb_host_config *new_config,
         |          ^~~~~~~~~~~~~~~
   include/linux/usb/hcd.h:451:43: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     451 | extern int usb_hcd_alloc_bandwidth(struct usb_device *udev,
         |                                           ^~~~~~~~~~
   include/linux/usb/hcd.h:455:44: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     455 | extern int usb_hcd_get_frame_number(struct usb_device *udev);
         |                                            ^~~~~~~~~~
   include/linux/usb/hcd.h:509:44: warning: 'struct usb_device' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     509 | extern void usb_wakeup_notification(struct usb_device *hdev,
         |                                            ^~~~~~~~~~
   In file included from drivers/media/usb/pwc/pwc-if.c:57:
>> include/linux/usb/hcd.h:657:8: warning: 'enum usb_device_state' declared=
 inside parameter list will not be visible outside of this definition or de=
claration
     657 |   enum usb_device_state new_state);
         |        ^~~~~~~~~~~~~~~~
>> include/linux/usb/hcd.h:673:54: error: unknown type name 'pm_message_t'
     673 | extern int hcd_bus_suspend(struct usb_device *rhdev, pm_message_=
t msg);
         |                                                      ^~~~~~~~~~~~
   include/linux/usb/hcd.h:674:53: error: unknown type name 'pm_message_t'
     674 | extern int hcd_bus_resume(struct usb_device *rhdev, pm_message_t=
 msg);
         |                                                     ^~~~~~~~~~~~
   In file included from drivers/media/usb/pwc/pwc-if.c:57:
   include/linux/usb/hcd.h: In function 'bus_to_hcd':
   include/linux/usb/hcd.h:244:1: error: control reaches end of non-void fu=
nction [-Werror=3Dreturn-type]
     244 | }
         | ^
   drivers/media/usb/pwc/pwc-if.c: In function 'pwc_alloc_urb_buffer':
   drivers/media/usb/pwc/pwc-if.c:170:1: error: control reaches end of non-=
void function [-Werror=3Dreturn-type]
     170 | }
         | ^
   cc1: some warnings being treated as errors


vim +/self +86 include/linux/usb/hcd.h

^1da177e4c3f415 drivers/usb/core/hcd.h  Linus Torvalds         2005-04-16  =
 82  =

^1da177e4c3f415 drivers/usb/core/hcd.h  Linus Torvalds         2005-04-16  =
 83  	/*
^1da177e4c3f415 drivers/usb/core/hcd.h  Linus Torvalds         2005-04-16  =
 84  	 * housekeeping
^1da177e4c3f415 drivers/usb/core/hcd.h  Linus Torvalds         2005-04-16  =
 85  	 */
^1da177e4c3f415 drivers/usb/core/hcd.h  Linus Torvalds         2005-04-16  =
@86  	struct usb_bus		self;		/* hcd is-a bus */
1720058343fa43a drivers/usb/core/hcd.h  Alan Stern             2006-08-30  =
 87  	struct kref		kref;		/* reference counter */
^1da177e4c3f415 drivers/usb/core/hcd.h  Linus Torvalds         2005-04-16  =
 88  =

^1da177e4c3f415 drivers/usb/core/hcd.h  Linus Torvalds         2005-04-16  =
 89  	const char		*product_desc;	/* product/vendor string */
83de4b2b90887b5 include/linux/usb/hcd.h Sarah Sharp            2010-12-02  =
 90  	int			speed;		/* Speed for this roothub.
83de4b2b90887b5 include/linux/usb/hcd.h Sarah Sharp            2010-12-02  =
 91  						 * May be different from
83de4b2b90887b5 include/linux/usb/hcd.h Sarah Sharp            2010-12-02  =
 92  						 * hcd->driver->flags & HCD_MASK
83de4b2b90887b5 include/linux/usb/hcd.h Sarah Sharp            2010-12-02  =
 93  						 */
^1da177e4c3f415 drivers/usb/core/hcd.h  Linus Torvalds         2005-04-16  =
 94  	char			irq_descr[24];	/* driver + bus # */
^1da177e4c3f415 drivers/usb/core/hcd.h  Linus Torvalds         2005-04-16  =
 95  =

d5926ae7a827bdd drivers/usb/core/hcd.h  Alan Stern             2005-04-21  =
 96  	struct timer_list	rh_timer;	/* drives root-hub polling */
d5926ae7a827bdd drivers/usb/core/hcd.h  Alan Stern             2005-04-21  =
 97  	struct urb		*status_urb;	/* the current status urb */
ceb6c9c862c8642 include/linux/usb/hcd.h Rafael J. Wysocki      2014-11-29  =
 98  #ifdef CONFIG_PM
6b157c9bf3bace6 drivers/usb/core/hcd.h  Alan Stern             2007-03-13  =
 99  	struct work_struct	wakeup_work;	/* for remote wakeup */
6b157c9bf3bace6 drivers/usb/core/hcd.h  Alan Stern             2007-03-13  =
100  #endif
a4d6a2989dc3f2f include/linux/usb/hcd.h Raul E Rangel          2019-04-19  =
101  	struct work_struct	died_work;	/* for when the device dies */
^1da177e4c3f415 drivers/usb/core/hcd.h  Linus Torvalds         2005-04-16  =
102  =

^1da177e4c3f415 drivers/usb/core/hcd.h  Linus Torvalds         2005-04-16  =
103  	/*
^1da177e4c3f415 drivers/usb/core/hcd.h  Linus Torvalds         2005-04-16  =
104  	 * hardware info/state
^1da177e4c3f415 drivers/usb/core/hcd.h  Linus Torvalds         2005-04-16  =
105  	 */
^1da177e4c3f415 drivers/usb/core/hcd.h  Linus Torvalds         2005-04-16  =
106  	const struct hc_driver	*driver;	/* hw-specific hooks */
8de98402652c018 drivers/usb/core/hcd.h  Benjamin Herrenschmidt 2005-11-25  =
107  =

c2e935a7db6e735 include/linux/usb/hcd.h Richard Zhao           2012-06-13  =
108  	/*
c2e935a7db6e735 include/linux/usb/hcd.h Richard Zhao           2012-06-13  =
109  	 * OTG and some Host controllers need software interaction with phys;
c2e935a7db6e735 include/linux/usb/hcd.h Richard Zhao           2012-06-13  =
110  	 * other external phys should be software-transparent
c2e935a7db6e735 include/linux/usb/hcd.h Richard Zhao           2012-06-13  =
111  	 */
3d46e73dfdb840f include/linux/usb/hcd.h Antoine Tenart         2014-09-24  =
112  	struct usb_phy		*usb_phy;
178a0bce05cbc17 include/linux/usb/hcd.h Martin Blumenstingl    2018-03-03  =
113  	struct usb_phy_roothub	*phy_roothub;
c2e935a7db6e735 include/linux/usb/hcd.h Richard Zhao           2012-06-13  =
114  =

541c7d432f76771 include/linux/usb/hcd.h Alan Stern             2010-06-22  =
115  	/* Flags that need to be manipulated atomically because they can
541c7d432f76771 include/linux/usb/hcd.h Alan Stern             2010-06-22  =
116  	 * change while the host controller is running.  Always use
541c7d432f76771 include/linux/usb/hcd.h Alan Stern             2010-06-22  =
117  	 * set_bit() or clear_bit() to change their values.
541c7d432f76771 include/linux/usb/hcd.h Alan Stern             2010-06-22  =
118  	 */
8de98402652c018 drivers/usb/core/hcd.h  Benjamin Herrenschmidt 2005-11-25  =
119  	unsigned long		flags;
541c7d432f76771 include/linux/usb/hcd.h Alan Stern             2010-06-22  =
120  #define HCD_FLAG_HW_ACCESSIBLE		0	/* at full power */
541c7d432f76771 include/linux/usb/hcd.h Alan Stern             2010-06-22  =
121  #define HCD_FLAG_POLL_RH		2	/* poll for rh status? */
541c7d432f76771 include/linux/usb/hcd.h Alan Stern             2010-06-22  =
122  #define HCD_FLAG_POLL_PENDING		3	/* status has changed? */
ff2f07874362d34 include/linux/usb/hcd.h Alan Stern             2010-06-25  =
123  #define HCD_FLAG_WAKEUP_PENDING		4	/* root hub is resuming? */
9b37596a2e86040 include/linux/usb/hcd.h Alan Stern             2011-03-07  =
124  #define HCD_FLAG_RH_RUNNING		5	/* root hub is running? */
9b37596a2e86040 include/linux/usb/hcd.h Alan Stern             2011-03-07  =
125  #define HCD_FLAG_DEAD			6	/* controller has died? */
6b2bd3c8c69c481 include/linux/usb/hcd.h Stefan Koch            2015-08-25  =
126  #define HCD_FLAG_INTF_AUTHORIZED	7	/* authorize interfaces? */
541c7d432f76771 include/linux/usb/hcd.h Alan Stern             2010-06-22  =
127  =

541c7d432f76771 include/linux/usb/hcd.h Alan Stern             2010-06-22  =
128  	/* The flags can be tested using these macros; they are likely to
541c7d432f76771 include/linux/usb/hcd.h Alan Stern             2010-06-22  =
129  	 * be slightly faster than test_bit().
541c7d432f76771 include/linux/usb/hcd.h Alan Stern             2010-06-22  =
130  	 */
541c7d432f76771 include/linux/usb/hcd.h Alan Stern             2010-06-22  =
131  #define HCD_HW_ACCESSIBLE(hcd)	((hcd)->flags & (1U << HCD_FLAG_HW_ACCE=
SSIBLE))
541c7d432f76771 include/linux/usb/hcd.h Alan Stern             2010-06-22  =
132  #define HCD_POLL_RH(hcd)	((hcd)->flags & (1U << HCD_FLAG_POLL_RH))
541c7d432f76771 include/linux/usb/hcd.h Alan Stern             2010-06-22  =
133  #define HCD_POLL_PENDING(hcd)	((hcd)->flags & (1U << HCD_FLAG_POLL_PEN=
DING))
ff2f07874362d34 include/linux/usb/hcd.h Alan Stern             2010-06-25  =
134  #define HCD_WAKEUP_PENDING(hcd)	((hcd)->flags & (1U << HCD_FLAG_WAKEUP=
_PENDING))
9b37596a2e86040 include/linux/usb/hcd.h Alan Stern             2011-03-07  =
135  #define HCD_RH_RUNNING(hcd)	((hcd)->flags & (1U << HCD_FLAG_RH_RUNNING=
))
9b37596a2e86040 include/linux/usb/hcd.h Alan Stern             2011-03-07  =
136  #define HCD_DEAD(hcd)		((hcd)->flags & (1U << HCD_FLAG_DEAD))
8de98402652c018 drivers/usb/core/hcd.h  Benjamin Herrenschmidt 2005-11-25  =
137  =

6b2bd3c8c69c481 include/linux/usb/hcd.h Stefan Koch            2015-08-25  =
138  	/*
6b2bd3c8c69c481 include/linux/usb/hcd.h Stefan Koch            2015-08-25  =
139  	 * Specifies if interfaces are authorized by default
6b2bd3c8c69c481 include/linux/usb/hcd.h Stefan Koch            2015-08-25  =
140  	 * or they require explicit user space authorization; this bit is
6b2bd3c8c69c481 include/linux/usb/hcd.h Stefan Koch            2015-08-25  =
141  	 * settable through /sys/class/usb_host/X/interface_authorized_default
6b2bd3c8c69c481 include/linux/usb/hcd.h Stefan Koch            2015-08-25  =
142  	 */
6b2bd3c8c69c481 include/linux/usb/hcd.h Stefan Koch            2015-08-25  =
143  #define HCD_INTF_AUTHORIZED(hcd) \
6b2bd3c8c69c481 include/linux/usb/hcd.h Stefan Koch            2015-08-25  =
144  	((hcd)->flags & (1U << HCD_FLAG_INTF_AUTHORIZED))
6b2bd3c8c69c481 include/linux/usb/hcd.h Stefan Koch            2015-08-25  =
145  =

ff8e2c560eca320 include/linux/usb/hcd.h Stefan Koch            2015-08-25  =
146  	/*
ff8e2c560eca320 include/linux/usb/hcd.h Stefan Koch            2015-08-25  =
147  	 * Specifies if devices are authorized by default
ff8e2c560eca320 include/linux/usb/hcd.h Stefan Koch            2015-08-25  =
148  	 * or they require explicit user space authorization; this bit is
ff8e2c560eca320 include/linux/usb/hcd.h Stefan Koch            2015-08-25  =
149  	 * settable through /sys/class/usb_host/X/authorized_default
ff8e2c560eca320 include/linux/usb/hcd.h Stefan Koch            2015-08-25  =
150  	 */
7bae0432a64aa75 include/linux/usb/hcd.h Dmitry Torokhov        2019-02-16  =
151  	enum usb_dev_authorize_policy dev_policy;
ff8e2c560eca320 include/linux/usb/hcd.h Stefan Koch            2015-08-25  =
152  =

541c7d432f76771 include/linux/usb/hcd.h Alan Stern             2010-06-22  =
153  	/* Flags that get set only during HCD registration or removal. */
^1da177e4c3f415 drivers/usb/core/hcd.h  Linus Torvalds         2005-04-16  =
154  	unsigned		rh_registered:1;/* is root hub registered? */
6d88e6792574497 include/linux/usb/hcd.h Alan Stern             2010-06-09  =
155  	unsigned		rh_pollable:1;	/* may we poll the root hub? */
0029227f1bc30b6 include/linux/usb/hcd.h Andiry Xu              2010-12-27  =
156  	unsigned		msix_enabled:1;	/* driver has MSI-X enabled? */
6a29beef9d1b16c include/linux/usb/hcd.h Peter Chen             2017-05-17  =
157  	unsigned		msi_enabled:1;	/* driver has MSI enabled? */
4e88d4c08301645 include/linux/usb/hcd.h Martin Blumenstingl    2018-03-03  =
158  	/*
4e88d4c08301645 include/linux/usb/hcd.h Martin Blumenstingl    2018-03-03  =
159  	 * do not manage the PHY state in the HCD core, instead let the driver
4e88d4c08301645 include/linux/usb/hcd.h Martin Blumenstingl    2018-03-03  =
160  	 * handle this (for example if the PHY can only be turned on after a
4e88d4c08301645 include/linux/usb/hcd.h Martin Blumenstingl    2018-03-03  =
161  	 * specific event)
4e88d4c08301645 include/linux/usb/hcd.h Martin Blumenstingl    2018-03-03  =
162  	 */
4e88d4c08301645 include/linux/usb/hcd.h Martin Blumenstingl    2018-03-03  =
163  	unsigned		skip_phy_initialization:1;
^1da177e4c3f415 drivers/usb/core/hcd.h  Linus Torvalds         2005-04-16  =
164  =

d5926ae7a827bdd drivers/usb/core/hcd.h  Alan Stern             2005-04-21  =
165  	/* The next flag is a stopgap, to be removed when all the HCDs
d5926ae7a827bdd drivers/usb/core/hcd.h  Alan Stern             2005-04-21  =
166  	 * support the new root-hub polling mechanism. */
d5926ae7a827bdd drivers/usb/core/hcd.h  Alan Stern             2005-04-21  =
167  	unsigned		uses_new_polling:1;
0165de09747be76 drivers/usb/core/hcd.h  Inaky Perez-Gonzalez   2006-08-25  =
168  	unsigned		wireless:1;	/* Wireless USB HCD */
7329e211b987a49 drivers/usb/core/hcd.h  Alan Stern             2008-04-03  =
169  	unsigned		has_tt:1;	/* Integrated TT in root hub */
7868943db1668fb include/linux/usb/hcd.h Huang Rui              2013-09-16  =
170  	unsigned		amd_resume_bug:1; /* AMD remote wakeup quirk */
14aec589327a6fc include/linux/usb/hcd.h Oliver Neukum          2014-02-11  =
171  	unsigned		can_do_streams:1; /* HC supports streams */
f2693b430b33d95 include/linux/usb/hcd.h Peter Chen             2014-08-19  =
172  	unsigned		tpl_support:1; /* OTG & EH TPL support */
074f9dd55f9cab1 include/linux/usb/hcd.h Alan Stern             2015-01-29  =
173  	unsigned		cant_recv_wakeups:1;
074f9dd55f9cab1 include/linux/usb/hcd.h Alan Stern             2015-01-29  =
174  			/* wakeup requests from downstream aren't received */
d5926ae7a827bdd drivers/usb/core/hcd.h  Alan Stern             2005-04-21  =
175  =

cd70469d084fde1 include/linux/usb/hcd.h Felipe Balbi           2012-02-29  =
176  	unsigned int		irq;		/* irq allocated */
^1da177e4c3f415 drivers/usb/core/hcd.h  Linus Torvalds         2005-04-16  =
177  	void __iomem		*regs;		/* device memory/io */
26f944b2716717a include/linux/usb/hcd.h Kishon Vijay Abraham I 2012-08-16  =
178  	resource_size_t		rsrc_start;	/* memory/io resource start */
26f944b2716717a include/linux/usb/hcd.h Kishon Vijay Abraham I 2012-08-16  =
179  	resource_size_t		rsrc_len;	/* memory/io resource length */
7d35b9298539d28 drivers/usb/core/hcd.h  Alan Stern             2005-04-25  =
180  	unsigned		power_budget;	/* in mA, 0 =3D no limit */
^1da177e4c3f415 drivers/usb/core/hcd.h  Linus Torvalds         2005-04-16  =
181  =

94dfd7edfd5c9b6 include/linux/usb/hcd.h Ming Lei               2013-07-03  =
182  	struct giveback_urb_bh  high_prio_bh;
94dfd7edfd5c9b6 include/linux/usb/hcd.h Ming Lei               2013-07-03  =
183  	struct giveback_urb_bh  low_prio_bh;
94dfd7edfd5c9b6 include/linux/usb/hcd.h Ming Lei               2013-07-03  =
184  =

3f0479e00a3fca9 drivers/usb/core/hcd.h  Sarah Sharp            2009-12-03  =
185  	/* bandwidth_mutex should be taken before adding or removing
3f0479e00a3fca9 drivers/usb/core/hcd.h  Sarah Sharp            2009-12-03  =
186  	 * any new bus bandwidth constraints:
3f0479e00a3fca9 drivers/usb/core/hcd.h  Sarah Sharp            2009-12-03  =
187  	 *   1. Before adding a configuration for a new device.
3f0479e00a3fca9 drivers/usb/core/hcd.h  Sarah Sharp            2009-12-03  =
188  	 *   2. Before removing the configuration to put the device into
3f0479e00a3fca9 drivers/usb/core/hcd.h  Sarah Sharp            2009-12-03  =
189  	 *      the addressed state.
3f0479e00a3fca9 drivers/usb/core/hcd.h  Sarah Sharp            2009-12-03  =
190  	 *   3. Before selecting a different configuration.
3f0479e00a3fca9 drivers/usb/core/hcd.h  Sarah Sharp            2009-12-03  =
191  	 *   4. Before selecting an alternate interface setting.
3f0479e00a3fca9 drivers/usb/core/hcd.h  Sarah Sharp            2009-12-03  =
192  	 *
3f0479e00a3fca9 drivers/usb/core/hcd.h  Sarah Sharp            2009-12-03  =
193  	 * bandwidth_mutex should be dropped after a successful control messa=
ge
3f0479e00a3fca9 drivers/usb/core/hcd.h  Sarah Sharp            2009-12-03  =
194  	 * to the device, or resetting the bandwidth after a failed attempt.
3f0479e00a3fca9 drivers/usb/core/hcd.h  Sarah Sharp            2009-12-03  =
195  	 */
feb26ac31a2a5cb include/linux/usb/hcd.h Chris Bainbridge       2016-04-25  =
196  	struct mutex		*address0_mutex;
d673bfcbfffdeb5 include/linux/usb/hcd.h Sarah Sharp            2010-10-15  =
197  	struct mutex		*bandwidth_mutex;
c56354378426e55 include/linux/usb/hcd.h Sarah Sharp            2010-10-28  =
198  	struct usb_hcd		*shared_hcd;
c56354378426e55 include/linux/usb/hcd.h Sarah Sharp            2010-10-28  =
199  	struct usb_hcd		*primary_hcd;
3f0479e00a3fca9 drivers/usb/core/hcd.h  Sarah Sharp            2009-12-03  =
200  =

3f0479e00a3fca9 drivers/usb/core/hcd.h  Sarah Sharp            2009-12-03  =
201  =


:::::: The code@line 86 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3253272020905316506==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICAR4+F8AAy5jb25maWcAjFzLd9w2r9/3r5iTbtpF8tmO7Zuee7zgSNSIHUlUSWoe3ui4ziT1
qR+9fnxt/vsLkHqQFDRpFq1FgG8Q+AEE58cfflywt9enh5vXu9ub+/tvi6+Hx8Pzzevh8+LL3f3h
fxepXFTSLHgqzAdgLu4e3/75zz+fLtvL88XFh9PTDyfvn29PF+vD8+PhfpE8PX65+/oGDdw9Pf7w
4w+JrDKxapOk3XClhaxaw3fm6t3X29v3vyx+Sg+/3908Ln758BGaOb342f31zqsmdLtKkqtvfdFq
bOrql5OPJyc9oUiH8rOPFyf239BOwarVQB6reHVOvD4TVrWFqNZjr15hqw0zIgloOdMt02W7kkaS
BFFBVe6RZKWNahIjlR5Lhfqt3Url9btsRJEaUfLWsGXBWy2VGakmV5yl0Hgm4T/AorEqrPqPi5Xd
xfvFy+H17a9xH5ZKrnnVwjbosvY6roRpebVpmYJVEaUwVx/PoJVhtGUtoHfDtVncvSwen16x4WEZ
ZcKKfh3fvaOKW9b4K2On1WpWGI8/ZxverrmqeNGuroU3PJ+yBMoZTSquS0ZTdtdzNeQc4ZwmXGuT
AmVYGm+8xMpEY45r4YD9WjF9d32MCoM/Tj4/RsaJECNOecaawliJ8PamL86lNhUr+dW7nx6fHg8/
Dwx6rzei9k5FV4D/T0zhT76WWuza8reGN5wYwZaZJG8t1a+VKKl1W/JSqn3LjGFJTk6v0bwQS5LE
GtBhRI92f5mCXi0HjpgVRX+S4FAuXt5+f/n28np4GE/SildcicSe2VrJpXe4fZLO5daXJJVCqW71
tlVc8yoND38qSyYqqqzNBVc4xj3dT8mMglWFccOpA61Cc2GfagPqC05kKVMe9pRJlfC00yqiWnmb
WTOlOTL5W+K3nPJls8p0uO6Hx8+Lpy/RCo46WSZrLRvo0+15Kr0e7Xb4LFYgv1GVN6wQKTO8LZg2
bbJPCmIvrA7djFsbkW17fMMro48SUYGyNIGOjrOVsGMs/bUh+Uqp26bGIUc6xp2MpG7scJW2Gj2y
CEd5rMCau4fD8wsls2C21qD7OQilN678uq1hYDK1Rm3Y3UoiRaQFdUjhf2jHW6NYsg5EJaY4qRrp
tlmvc7HKUSy72dgBdGIzmcewBIrzsjbQVBWoiL58I4umMkztSS3QcRGT6usnEqr3qwkr/R9z8/Ln
4hWGs7iBob283ry+LG5ub5/eHl/vHr+O67sRytitYYltwy3M0LNd/pBMjIJoBEXHbwgPnBVouqGB
b6lT1E0JB80JrIZkQvlBSKOpFdEiWGAtBkuQCo2IJCVP/L9YNLu4KmkWmpLTat8Cze8bPlu+A0Gl
dk47Zr96VISTtG10p5AgTYqalFPlKNl8GF4343Amg1Zduz88PbsehE0mfnEOOhcPwMMInxAnZWBB
RGauzk5GKRWVARTKMh7xnH4MtEkDENOBxiQHtW7VUy/V+vaPw+e3+8Pz4svh5vXt+fBii7vJENRA
L+umrgGI6rZqStYuGaDrJFAClmvLKgNEY3tvqpLVrSmWbVY0Op+AZJjT6dmnqIWhn5iarJRsau3L
ByCDhDpOjtWtwdhAxoRqSUqSgZJnVboVqckDATR+BfIodX3VItXH6CqdgX0dPQM9dM3VMZa8WXFY
zGMsKd+IhNTdjg5nFHVCgLG68XOVzddb1lm8Ec76e3BBoqLrSMywwKwAegQ4ATqJ6iLnybqWsN1o
EwDGeIbDSTH6EbZhv00w67BrKQcFDuCHU7hW8YJ50GlZrHGBLKpQPgjDb1ZCaw5ceBBYpb1XMopE
6qA9uQ1AnMX3QJvB9rYWjesticb0QJrB80sp0aCFSgjOnKzBgIhrjubZbrhUJZziEHJHbBr+oNy/
tJWqzsE93jLlgdcB+QdKSaSnlzEPKPaE1xaVWuUaw6JE12sYZcEMDtPbRV8UnXEYv6OeSjBaApwD
FQgOnKIS8VMHDMnFddJFcPS6BKae+pjTQbQB0AR6O/5uq1L4frG3S7zIYOf8IzBdiNHUM8DnWUMP
sAFE5uk+/AQl5fVUSx8Ua7GqWJF5x8LOxS+wMNcv0DkoYE99CxkAFtk2ag6lsHQjYPDdAlNqYXTQ
cAMt/sjSdhucReh+yZQSod7siGtseF96u9GXtIE7MJTa5USdYcSGBwLXTnyI0dj12AjZfhWBasUi
UE8FeA/E+LxpRe2ibRynBp1XSS8U4+nX/DdyZaEeT1NSH7qDBb22sddTJ6cn5z1O6KJ69eH5y9Pz
w83j7WHB/3t4BCjHACokCOYAo4/ILWxxGIi1D44IU203pfVTSej4L3sc0HLpunOgPThwumiWsWXC
SBaDDbLe0njCC7akUCU0ELJJmo0tYY/UivcCELdtLXohwDtVoCpkSauZgBEjBYBUqa3TeZNlAOtq
Bj0SDj8gy0wUAR6zWtXa1cDDCoOEPfPl+dJ3tXc21Bt8+/bShTFRdac8kSn3BiIbUzemtabFXL07
3H+5PH//z6fL95fnfpBwDYa7h3re7hnwHx3UntDKsomOSYnoUlVgj4Xzvq/OPh1jYDsMcJIMvYj0
Dc20E7BBc6eXk4CLZm3qRyR7QiCRXuGgcFq7VYEwu87ZvreIbZYm00ZAMYmlwlhIGuKdQZegY4nd
7CgaA4iFMW5uTT3BAXIFw2rrFciYH0HAMWluHHZ0zqvi3swrDtCtJ1mtBE0pjNbkjR9mD/isfJNs
bjxiyVXlYllgcbVYFvGQdaNrDns1Q7Y62y4dK3pEPbJcS1gH2L+PXrTZxgdtZd9maIA+Omep3LYy
y2Adrk7++fwF/t2eDP9ov6axkUNvmzMADpypYp9ghM63qPXKOXMFqLtCX11E/hOMgbszg1vDE6cR
rA6vn59uDy8vT8+L129/OW/cc/qi2Qaqq6Ri2qgPMs5Mo7gD834VJO7OWC2SmZplbUOJQRhRFmkm
dE6idgPQJLg5wUacEANyVEXcOd8Z2HGUog4kkboWOfGEFW1Ra9pXQxZWju0Q/pQHb3TWlktB63Xr
t8gSBCcD12I43JRR3oPsAxgCrL1quB87hEVjGBgKojFdmbNxM+udb1ApFEsQjHbTi8U4SV5RaAmM
atS/C8fWDYYDQd4K0yHGcTAbOhw/DPJIvCpm7SMVQyO/MlHkEpGDHRaNIhNVHSGX6090ea0TmoAo
i/bswJqFNjzWwnUTyqvd7wqMY6diXbjm0mcpTudpRieR/Jf1LslXkVXGwPImLAH7JcqmtAcmY6Uo
9leX5z6DFR3wwErt2W0BOs8e8Tbw35B/U+4mh3+EHRhoRD+RFzzxg/XQO6g8d+KmxXDKAq+zK873
K0lJZ09PAPWxRlFVr3Mmd4KqnNfciWJQLy3po7tiII1CAtwgmqqsldII6cBOLfkKsMIpTcR7ngmp
x4oxYSyAmRRoy8OrDysteLXaopqNBE32hYEeU1wBFnNOfHcDbOMCeBU1q/zKUNk5U+Kh8oenx7vX
p+cgAO7B/06/NlXkwk44FKuLY/QEg9MzLVgFLbewmw8jqp0ZpL9Op5cTiMt1DcY3PlL9jRGAlqaw
WCNe8LrA/3A/LCE+BdqrFAkcDTj9cyZRu+GHBk5Q0B9pFxYBhMNIhYIT166WiJkmBjmpmUta0EYk
9IbjQgLcAElN1J68HHHAxRpvx8gIvDWQR0cooFvF0F/i4gWkNw9RFHwFUt2ZR7zWazgiqcPN5xPv
XzQ3jBgCCpca3WLV2CjSzMq520+Mmm89NVgaFSgD/EY4JYy4Jq00NgXQP5obWCcNIA0FnoURZUt2
jl+8Mxq8idkD2JRkTsGIXbp17AAf4uA130923/EavbMLjgj1aKMjY/WdljAUOzt4vdrRIYmMVrX5
dXt6ckJp7Ov27OLEHwqUfAxZo1boZq6gmcG5tJgsV3gj5yF5vuOB7rQF6PTQsC9RTOdt2pAwuc73
WqCWhpOn0CM4DR0BjAWB496dojGWY+UEI64YgjrWLrh6qwraPQuaTfdglgGDdLIBTiBo/kn8Y5Pq
ID6HJy/Zx9qODPZGnDtZFftjTeElLb16ZWpdTbBEVNASRExkMIHUTCNu1t8swFGu8XYp6L0vJGNL
xzyhia/L0rTt1alPc5qvX+Bcmrpo4quvjkfXBaD+Go2U6TAtwYWep/V1S7FSkY3x+UxeByzOIj/9
fXhegLG7+Xp4ODy+2kmxpBaLp78wBc/d6/Vi7/xhSqoC1VSXsz4FkJIiMG/b35wJhqOdiUTwMQ46
a0V69xfH6c118tULkz0lGvS2XDd1tDiwIrnpIsRYpfbjIrYExMeASXKDtGBCeyElz4GohZv2ilT7
rq06Ua2JTJ8dae0DCluk+KaVG66USLkfggh7BAVD5M74HCye0JIZMJD7uLQxJtTZtngDvcu5pjM2
rZCCoM7xWz9CcdhxraPuR/gfA7aILNLJ4g3EyWDGamy1UiAN4MDODc7kgMJYEbWdNBq8tTbVoEhQ
k3s3euNRt9XtIWtqOGBpPMCYRgjNjFOKc0gEho7n3FYcowRXBnTh7NQ6LQNIM4b3TiqXM6jO1p25
rPZXp+Qml0fYFE8bTA3DqPSWKQQHxZ6yssMxZDUXkcIeyrs7r7ALJMwPIK1NdnT94O84+2zQWALv
MUF45pEhaLWJU6hDpNInAy2y58P/vR0eb78tXm5v7gP3pz8eoY9rDwyeidhVtYT+zmglN/49LG0y
yUqo1zQs8IyvPKmAl032Bv6745FVymE0M8kOVA2gdRmGx8cTzXbMegk5+qnN0I/P5N/P4NjIh33/
Eu/74vPz3X/d7RcBk2urBWfxcZ3YOBF2Px9+7FTuUSaw6DwFA+cCIkpU85i8PnehtTI86nb8L3/c
PB8+B6BhzOUiZH5YFvH5/hCegE7BB8ts44a4zAXAKlLPBVwlr5rZJgynpxgw9TFKUkk5Uh/P9G/E
hhl5wV27nXEe5IgpvwvA7FIt3176gsVPYBEWh9fbDz97kRMwEs6L929iRVuW7sO//MI/MJx3ehJg
X2RPquXZCSzBb41Qa3KV8FZq2VBgo7uvwgiSZ/4AvFberYgVub3Olv6qzUzOTfzu8eb524I/vN3f
9LLVd4hxxpnAys6/dum8lmnRhAUjXM3luXOOQIr8C8UuIX2oOQ5/MkQ78uzu+eFvOBWLdDjnvROb
BhFL+Izd6oGWCVVaiwn+QuTs9xzbNsm6LBO/Vb+8d5aooLOUq4IP/YQXK5aEATgb7rMoZnLyzeHr
883iSz9Zp9R8BTDD0JMnyxQY/fUm8Cwwvt/A5lyzmTgNorHN7uLUv3TTeLt22lYiLju7uIxLTc0a
e70UvIK5eb794+71cIuu3vvPh79g6HhUR20XePRhxNIFAcKyPtKPGtfD4dJdvfNpSZekYJOQ6sLP
xrGrdKQiYKUpNlm7e0Ni/X5tSowaL/3ImnuwZINDGILLTHC101Gtsz6lTm4o7XhHV6+p7FHDzLwE
kfo0KmYf+xhRtUu9ZfGjHgHLijfqxH3ymux5jVeCFEHWdHnXDD55yqjksqypXOwMHDX0TqpfXSwt
YgvStMZ8JNtiDn5pREQ9iqherBrZEE8KNOyStVXusUW0avaqHdxTDIB0eYhTBs37SOoMsQsKl5NF
dyN3b8dc+ka7zYWxiSdRW3hFroegkn1q4GrETeoSIzbda694DwB7w7GuUndB3UlKaGccn/axc7g9
+DJttmK+bZcwHZc6GtFKsQPpHMnaDidiQiSJt82NqtpKwsILP5ElTpYipAE9I8RWNhnW3b/bGlQj
RP99apTqlgiDitSuUcebohK5a2XZtOA/g5PcubOYa0SSMU2eYumky50Gl4De3UTGg+lUQidcGNyK
OLp67iJrhpbKZiZnozP2aM3dw6T+8SHBK4vU46dWTfMEGY6QurwXT2fGVSaMoxvZUdzt7lxYzesS
978AYY3GM8ntGNV3WD72HFBwMyR57z72vRUmB0XtRNAmK8RyijqNfvdDkm0+DLYW8c2/cQmMw/SZ
S3y2JZ6dJiWLy7i419gV3lOh8eojr/+Wj+jKnQmgY1JjHJu0AmiJGAMGwKLIrrTMrLY2+8k80v5i
jSegkzzxBVKDMVE0sJgojOedsAOW1F8pUH0HeXGxld8JQxuosNaYake06+XJzTXisxBNdWTLjpci
8TCduHavAKeWG1ZGuGj8kFE4cnTeUGhSUGVoseqi5R8nTkZHZxFOGLyUpXA5BtR6o5S0/ZEYYfFQ
Ohczt0Yd3HtQp90DXrXd+VpglhRXd5JDVqdI49AxfRkctu7iKjTzaPr8RNx4r7s05v5+ebqDPQSd
p0ze0I9HbO4FQnjb0CUhwzm2SbODj5DIzfvfb14Onxd/utzjv56fvtx1kb3RmQK2bn2P7ZFl67E7
63Kk+nTbIz0Fs8bfOMB4r6jIdN3veDN9Uwr9DVDH/oGxee0a06/HNJNOlfjy2AmCfbrZzuSsdzxN
hfTZyo5Mp1GNeHGOju1olQw/IjDzQqPnFHQUviPj+VR8Jt2v40HJ2AJk1BpN0vBWqRWllSGyalOB
EgaNsC+XsqBZ4HiVPd8aHxjMric+L+R8vOoaHxAUM/cyujodw6NN5U4JWAww5Lj4k1vH8fbNSAT1
qtxGHGhT7Pv71DZjn1rPs6gtxYBnoYItwwuwgtU1LidLU1z/tg/ZThRU/7ihXfIM/4eAOHym7vG6
6+Wtgsb5kOvK/zncvr3e/H5/sL9esrCJQK+eh78UVVYatIsTxU2R4CP0/O3wEJ0PYW80sf3jzW9R
NzpRwtd2XTHIV+KFtCVer5S1f9Tn5mEnWR4enp6/Lcox5jgJZBzNtBnTdEpWNYyiUMwA7MBZ5xRp
46Jbk6ygCUfs3eGL/ZV/p9uNWGg5RAX9Jz7elTv1MsLdt9u7dpdLdx61u8QDHrbaFTkpSGbCUiNx
HKpFhIrjYQqQKXGN70IBbW93+gbyvU0zAIcsfnThUmYlYhMvEqW9fenFz667+7mBVF2dn/wypI4e
R7okvmXFloUZRCRb6Z5szdlBFzTAdIUw4hNk96+9uSTg77i0Ka/MfzkBH5OXPH1RpsNCfHmgr/4n
EBsPYhODvq6lLMbzeL0ElD9+fcwA73nfuuy3ceihL7Nw5UhisM3s72NeHghN+9c8U7dqUHi1fdQR
Ohkun3wTeYRjOpr9cQWo0mYFW1Eauo4TxmB3bBLtzO8BwFFtw/igDSLhbbDdbwy/Z2RHhjsnxtc2
axTdPgIwqL557TbKkR++XC9d0n8feLIqsjq8/v30/Cfe0hF5MHCU15zaKDCfHvTFL1DhQQDblqWC
0UjDzNj/XaZKa81IKswHg7N0zbS2z6k5uR/CLcV4uVO7EDP+QAl9+1Pjc0u8cgXDjTnB1FUcMNWV
L5/2u03zpI46w2K8WqCTGDsGxRRNx3mLWhwjrtDa8rLZEcN0HK1pqooHbxEAR4DGlWvB6d1wFTeG
zjdAaiabY7SxW7oD3JaW0Q8iLA1Q5TxR1GhtZnZ7nK5fiAIZFZmk7ovD5pu0nhdgy6HY9jscSIV9
wZASLbbYO/y5GqSNmM7AkzRLP7TRW7aefvXu9u33u9t3YetlehHh/UHqNpehmG4uO1lHF5a+prNM
7rE7Jkm36YzPgrO/PLa1l0f39pLY3HAMpagv56mRzPokLcxk1lDWXipq7S25SgGHtvguxexrPqnt
JO3IULvLrC497wijXf15uuary7bYfq8/y5aXjH6v47a5LsiGeiRQm6SOzoktiw6QK4sFyZWuG/yt
PDSCs8oFf4wJ474lm7mD73kAANpAEZjbsp57Hg/MLqpMUpf1ESKoqTRJZpWzTmYUt5r5/RLYbnrx
maHf2RVnMz0slUhXFIB01wuoYnT4syGuiGxsU7Cq/XRydkpnyaQ8qThtDosioZ94McMKeu92Zxd0
U6ymf46lzuVc95eF3NasoveHc45zuqB/8QPX4/85e5blxnEkf8WnjZlDRYuUZEuHPkAkJKHElwlK
ourCcJc904512RW2e6b77zcT4AMAE2LHHqrbQiZAPBP5hj8RTRxRgepxhrYvkKxO3Io42cDyMRQg
TmRjecGzkzyLkVd1N/0Ef2L2UyXN9N4naeG5RHGEmaQ/uZd+Tkr3FFhlL0YyBwlG4n3gw7ovK/8H
skjSnEOb8QZxilJ4nJQGnChhUpJhPuoSrlH4uzR2ao7NvcXptIkmfJQB9bqcpdpIZg3IZJJvPp8+
Ph1tpxrDodpxenOq01jmcAvnQA1zZ65aRn7UvAMwmXNjaVlastg3e57DsvE4125hGksfzdo2h4gK
4zyLkifalWH48HaHhzEYewZ2gNenp8ePm8+3m9+eYJyouXlErc0N3FcKYdDNdCUoZaFwhHH9tY64
N4Kbyu1BkO5rOPdrS6rG30pjYCddaQF+7+SICZobinixb3xZNLMtPZ+FhEvMEymj2NotDbtyX8cY
+m+rBeD4QPeSxIyZZyLJNUlrS3i1r0Ck74iPa9Ya0rOoJYyf/vP8nfDy0sjCvofwt+/aKiLDiOT+
aPN42tJ2JJT6iPbHQyiTRWo1o0qoPCM9jPQH9qChMvhvIU84JiMiyPg0E6DcGCXFuCJEeSq6s3Jl
0ypv+upI3W8IQtUfHt4h55VVU+Q0wUcY0Gw/jNGUWn2ydcewZwOtirCxfQF3PY5nKRUMXSz8840Y
f2thNCIvQ/wPfZ+28QXou+lSOCz7/vb6+f72ghkBB6fn9vB8PP/79Yz+f4gYvcEf8o+fP9/eP00f
wmtoWqf99hu0+/yC4CdvM1ewNDV+eHzCsF8FHjqNSURHbU3j9i6+9Az0s8NfH3++Pb9+Wiom2Bg8
i5XHEXk7WhX7pj7++/z5/Xd6vu0jcG4ZnYrTeZSut2Y2FrGS5iJLVgjnJh68Kp+/txTzJneND0dt
CN7zpDCdZqxijKDdWwmmT1Va2B6wXRlwGUd3FlsUuEKzmCU56RoL0r76Yu+Dq9KOd2S/91t9eYOd
8D50f3tWJk+z632RUtPGmHPTsBHVVckGB9xhTEMt5dnVz0ffexIB7jOdr4MY0VChM2aamlN3RL0W
Vhk1Md2hZWrqZxnN4nEpTqQysAXzU8nluBrKwW1dEC3Q74ZS9CASU9a9FlUnzO7vayNxhooq9uTT
RvDpmGC+no1IRCVMy3bJd5ZuXP9uRBiNymQiUjSs/HDLi1SMCs/BqH6ainz8ofJ+/KEo2owaFHPD
9od+osovSO2prZuWArYVB9Ku3UzJY+45i33MwaNibozDme5Fowc/iGC66Mql22Eg5WlXg+yN+UWD
ncyBv4voyL1dZvoMp1Vs/dB6FuirJpAP75/POL6bnw/vHxavhrisvENJp7Lb6+OMNeiHCYJpV47x
RK0OpJ1olelQ2dK/BN4GlC+08o3hMd2YRkOTSR813VHr0dDUiI/wJ1x6mItX57+r3h9eP3SUwk3y
8NdoDvK8cAaC3xRojYQtpqXejgCWLP2lzNNfti8PH3BJ/P7807hszAncCnvavvKYR84RxnLYGe7J
buujbkGpV3ObAe7AWY6WQkpj1yJsgHhf0IakDYqjBhIDfqWZHc9Trl32rSa0a1l2aFTW3ybwNOGg
hfZMO9DFxEc8+YiI3tAKYQJzHl4Zuwicc4FlITWZYnGtmZXdDHCORLsYM4XvvIw3QhrjCxqjcrjI
2bj0WInEObIsdc5WntoYbCMx7sdICHNlo2ve8+HnTyOeT4ntCuvhO6YLcE5DjlJujVOPKlv3tO0v
mNPDoq5Dcetp4pndDmlXYBoftOY7ayM3UbOr6bwaauRpfHdbl2RuKoSLaF/r6bKqcbkJS09SSjXi
w2q2cJu1OxZtQrQxe7R1iAKi+OfTi6djyWIx29WjSYtoeUwNRQXlnUqgHNStoqonrNK7ZRAfJhZa
p0Z/evnXF2SZH55fnx5voKn2SqNYcfWhNFoufSRDJl0frJWGQh+NqWKsYW5p+N1UeYW5RFBJZPp4
tFDgiGSbtDEIV61k9vzxv1/y1y8RDnCk47D6E+fRbk5e6NOToTWJwIXbxwRLRolqFb3IeMbIHBT6
eJ9V1f6OevjvL3AjPoDw8qK+cvMvfYgHec0djPpyzDEu6eoW0j10JGwXntYicvelAuAhvd701QSE
PRYrMX3kSMRKnz++kwPD/0gx0SiwZ/mVo6gmSMhDnkV72/qufeiiCJb/37Dghtjs1ufmm1xmKUqm
ewYssv32hQelkakn/Z6Dv/GkdKE62+uZcVeqISUFkNOb/9H/D0E2Tm9+aDcTz5nWFagPTjdlzspx
I+xpgoLmnCiverlHxyLnNCuEDd+0r3ANzz50MHSZswSdDrBLjtz9mkoo6XD7OaWOclOp6MgaO+uu
r6ApLGeorhQkWsFoc+5QEcTmLZWdxMBQKkpbs91BWb1a3a1vr9QHamhkdLO8WpRLixJiU5Cj20Q/
XcLUz7fvby9mXuusaNPTaHp3Sjmln7LK+4M8FsKAQ5F5KWGR5Tw5zUKDIWLxMlzWTVyYAZFGoZJo
B/nxmKYX910msUkxIM9jjWRZ5bnKK7FNFc0mJlREcj0P5WJmcJEgmia5xFSQmDlBRLaCYA+ibkLT
SFbEcr2ahYzM9i5kEq5ns/kwSl0SzoaSbgIrgCyXBGCzD+7uiHL16fXMYjb2aXQ7X9KG4FgGtysa
JJ1LnNT9jd7MGwzJmKO7bmS8dTV4XTOngmWCSqQbheog/rB/w2aAHrGyCQM1I5qY8wI5txEh1+UN
q0LjfLSFOuuSOUMtIGX17eqOtn+3KOt5VFMHsgWDmNKs1vuCy3r0Wc6D2Wxh8mtO5w2NwuYumI22
ahvO/ufDx414/fh8/+OHyhvfprb4RNEZ27l5wdviEQ7m80/806T9FUoiJN3/f7RLnfb2+A5HAZ03
VHrGwuP60qb6oxmZHgr/JhCqmsY4ad3oKfXwSiDVn+8pksCjvUWV0asdxhNh5KuP70KUEjMITmMc
JW1/3DOQeFnDBLlMFr21rHMi7tMCSLTgt3zs6GQgED3mzY1IVTDUuEfpeI3rhwM55zfBfL24+cf2
+f3pDP/+aRkiuuqi5GhzJkfbAVFFciFHfPUzxsSyCPZCjgkLlQ6WorwgpOks14ZUqzwVHD5+k2ex
z11J3UgkBIexO/qMDfxe5YW44iJbcQ+9haGhCxC9/wsv6FT7IKji9JhEN3BWjjHt1LTzODtB/6SH
xsO44C+Ze+zm1ZHuIJQ3J7Uy6lVMT+0Tr6ik6tpTQHlRG4QoS9Kc/hgqf30eTMA3OqBO9vx8f/7t
D3xFWGojFDOC1iyuu7MQ/s0qho0fg/Eqe6ee4N4F+jOP7FyrJ7geOa04qS7FPidjPoz2WMyKys4N
2hap9J5bQfJMZgM7bh8hXgXzwOfV3FVKWFQK+IiV5kcmIN1Jz/EdqlbcTQbIHWbCvYMqMqLDbDRl
38yoFgtkhQDCz1UQBI2zAQ0OCerOPa53adzUu81UX4BcZJWwfDPYvSd6x6xXRvQAcDvlFgPLqsTn
HJgEXgB9FBHim/ypXXAs89Iepyppss1qRea6NSrr50rtw7BZ0C6FmyhFwufxJstqejIi366qxC7P
5t7G6NOoc3UiN+urSGlP7QFHTo7GTUZ57Bh1sILz9BmQbMrDxKp0EkdrXqv9MUPTLExIU9COVSbK
aRpl40mibOKUHpxE3B9d6z0xij1PpC1ct0VNRe/xHkwvbQ+m99gAPlFqCLNnwAha/XLJF1FFReJZ
RyWqG3wSkOZUMjIGyGgwtkm+Dr9IyKzcZq3W52z4UBLSvsQSltF13Rm3hxnSVMaoYUfzcLLv/Bsq
90hap/OCkaD9kZ3NxJ0GSKzCZV3ToPZhh2Gt6FzeWDxz8WYewWVHs/9Q7jk5ovZVca+TAbLwfp0m
al/TicUC+fvE7adR0lPq82eVhx39fXm4ULY880PwFZbl1r5Ik3rReFx2AbYcScwmVJ6vgrfnif6I
qLQ3wUGuVssA6tKC7UF+W60WI0mQbjlvN/NA3lh2t5hPXJ2qpuQpvaHTS2mlocXfwcyzIFvOkmzi
cxmr2o8NJEMX0by/XM1X4cQFDn+i9tNi5WTo2U6nmoypsJsr8yxP6dOf2X0XwIdhsG8G3CvmUmxc
7mDcwmq+ntkkMzxMr3B2gpvKotv6KXpafjEq5gerx5jFeOKO0KGfMJKdyBx9JbC3sMvIib1wdKHa
kk/KmI3zTGKyHUsZm0/eW/dJvrOzOt8nbF57LL33iZflgjZrnjU+8D0Zhmd25Ijqm9Tiau4jVM35
oq7KdHJLlLE1tPJ2tpjY8yVHicS6QplHtF4F87UnwAlBVe55SncV3K6nOgH7g0nynJQY8FKSIMlS
uNUt05fE68cVhYia3Ex+ZwLyBERM+GdxqNLjhg/l6EEYTQlCUiR28ncZrcPZnLJjW7WsMwM/156n
OAAUrCcWWqbS2hu8EFHgaw9w10HgERsQuJiipTKP0A+qpnUGslLXhTW8KoWN/zeW7pjZlKQoLin3
GL9we3BakRVhQFDmuS0E+QiV0YlLlhfSDuePz1FTJzvn9I7rVnx/rCxSqksmatk1MFc1MBEY1Cg9
cZyVo3Ebt3my7wH42ZR74XlCBKEnTEclyLwORrNn8c0JldclzXnp23A9wnxKyNaWHLPx1rbDauEn
nS1OksBc+3C2cex5LkcUhT98XW7cV3AGzcv+4gvsQS6VeOWw9U2XlBdM72s+ghpfTDwR/kVBl8uE
cErYv318fvl4fny6QbtAq95WWE9Pj22oFUK6oDP2+PDz8+l9rN4HpDZ8TWnBTRUogkBYpJcCgQcQ
jjwaLQQXfMfk0ZMkCuBllayCJb0uA5xWsyAced6VhytAOPzzqW8QLIo9TcnO+iYwfg16z1RfxBSs
2ts39P7aQxjVfuljBO1GUzO5gQkyVFkEtFMXECDn2UEXVMJNaFHvHI1x9I4thUyXlHek2eggAlJA
Dpyud05NUYcAl8wOZ7NgPdNEAaWgAWYqF7O88uB/u8QmT2SClEKWZ7b+5eyzvaQ1aoBponf8Kip5
bPzZO4BIOT5QBvEzwgEHJlzGhH3u9ecfn14zoMgK8+Es9bNJeGy4kOuy7RYzDKmAUfOLCqbzXx18
r7xppJRVpahdpN7/+wUfFHjGV8//9WA5kbS18V1UmJDxxzsIRmaSCVQcNAkCPEgP9a/BLFxcx7n8
ene7slG+5hfdC6uUn8iu8ZNDKIwF8YVj6poHftnkrLSsDV0ZkCuadhsIxXK5oj2vHSRKPBhQqsOG
7sJ9Fcw8JN7CuZvECYPbCZy4jawvb1e0T0aPmRygv9dRvA6NFoYKR/ckHegRq4jdLjxe6ybSahFM
LIU+GhNjS1fzkKYkFs58Aidl9d18uZ5A8ryfOSAUZRDSmvMeJ+PnymNr7XEw6QKq4yY+14qbE0hV
fmZnRlvlB6xjNrlJqjRsqvwY7X3pqnrMuppsDHVzDackE4PoGP6M6gHoQoaWP25X2LCkoLNqdgib
i5OltAOg9gX+7+FGBzwQsFjhfUGVwAOxlI7sHnCjyxDFNwKqbHBEBOkIkSd49XrScxgd48gJeZRD
xmfVAgsyTKFH2mLaNtc0PYBPqfrb24R2DjW83FUpyM0JV593IZsoXa7vFuOljy6soMx7GooTYztM
2uVteKDTZg+9vn4nWde1FbWinygHMjnu57ApoGH/tPRYwLCPr024YzE7FRUZqhFUJiaDa9G/FffP
Ih4xw8/UBIkCOUfjcwZwzzJg4jzp7ga0wwZ+EP0yUFrxaNQFvReAVQTmfuEyEGo3aK7DGNZQiAFn
BS/bWNChZwYGi+9Wd9R1biNZbnkWCGWSJiUtzxbeEa5HUUfCyERhwjfHMJgF8yvAcO3rA8oEecYb
EWWr5Yy+7S38yyqqUhaQqtYx4i4IZnS/oktVyUJ7gPn6plHofT1GXHSNXcGwjqyJELP1bL7wwPDw
lLmvm3uWFnLv87MzMTn3pAa0kHYswbQtIy93CreO5mj5JLvdijs0cJfnsahp2F7EnBe+4YpEwI6i
2H4TS97Ky91t4Pn4MfvmXXV+qLZhEN5NDR11C74mEso7wcRQNKE5r2azwNeIRnE2H4kJDF4QrGaU
httCi+RSLxbdSiqDgFIBWEg82WLGe1EsvO2oHxPtiIzX6jahGjjcBaGvdeAeR0kTqBXAR1GrZT27
pb+h/i4xLOQK/CwyDxTDPefzZd1U0nOer9HLc1yt7ura9Zg2UZTGLk+LXArytepRXwWIVXNfa9BL
dZ6ndiXghbNZfYWOaQwPndLAu6vARthOOSZKmTZkMljrXIuEW7e9BZN+AiurIJyHPli6NUPoLdix
XHgInKxXt0vvOagKebuc3U0Rqm+8ug1D79J9UwbjSRJQ5vu0vWppadA6fPdyWU/2S2SiElY4SSu9
CEndh2Uq3AtQFVkLokqA+XRKtjPjLZKuRO9YBzOM26ADy/KqagQU/WtBodv8fDZuYE4RvxbExuie
/IUt0OJktKL/4f1RJTERv+Q3qJKzwqZKM/MGEbTmYKifjVjNFqFbCP+1o9l0cVStwugusCKHsLxg
Jap8jGVuyyOUHYkZ0eBEbFBi/cutVrIzOS0a2jrkXmsYYKlOG2XXLKNWRLaKterG7sjRR+p2LOVt
fFGP3JU1mVwuV1cqNcmCrMfTYzA70IqRHmmbOtdzb2GidkUfAEHpcXWAxe8P7w/f0Qw0isCrKisJ
xMmXDXy9aorKNqq2j9JjMVEpUUl1MYtN+y5KG1T+/vzwMs6v0co+KjF8ZPpWt4BVuJy5u6ctbmJe
lFxlG+lSa3h2S1fBCn80AcHtcjljzYlBkfV2j4m0RWPJgYZFOoaBBlqZ8EwAr1lJQ7KyOaqcLAsK
WuJbYCm/hqIywsc89s1dyjJMrVmSF6mJqJLz2Ml97DXA19X88FIyT8UzkAbvyvqJQ99wFa5W1OVk
IiWF9CxmKvqtmb29fsEyaETtUWVYHUdF6co45QnwWkTPO1C3Gfx96zH7ZQ4cDPvNFaPQ2Gnu979K
yiLUAlFBJu6JWhpA9dnFlFGU1R6LdYcR3Ap5R/IMLcomSm/ndU10pIX8nZ6018PXimE4FUW5bERE
sm8EG4aSkToLo7NkIm3YMS6B2vwaBEtgUV3MMhp/Ai4jWGLddDAaRln4rjcAbiWsTaF67u6DAXRl
NygkkW0TXl+fI1mU8egTWGg13qfDsMi4UyuNqjLR+j+3wQzaUqnqbMuVciSrvOEO0SVKWOyxAaR5
zbRtO/GlokAMmWICKI/78SWLlA1p53ktgszamTX7OLFEsqzZecLNs/xb7nF/VTnNQBjJPL7xeuLQ
6EgrYeEGR4N8Vhl30lAGt/SJJ7/2qRVUqemzlxTjW6so0FppuR+pULlrZ1IUqUAlaZx43tJIN61T
jfY22NpPEJ/b5xmHw9MX6WefRY7PMRFQ7dZAADAWy4xu7wEbtiD9+wYM9L4iWmxzCxOQGp1KSmZF
NBcFRqiR+W3OzHyRFp+z4daTRqeDVZCdrFQ4AG9Z9mFwBel+Cuuxi/Y8Ooyfzq4i+Fd4EiDwJHKf
WeuBtUiSy8Z17+mSiY44zV4yateyPEr15Kl1/E0YZojTyR3HhvEwIhwUzMyGmJxCmSxy4Al31ttT
WKoMbkANc7tYp6OyvJWxFN8ythOjG9D0WHe5BdI/Xj6ff748/QnDxi6qTENUP7HSyC7SlSdVtJjP
qJwBHUYRsfVyEVCVNejPK5VhOgybQluYJnVUJLGZJOzqYMz6bZZO5PDt2ZR2UkksYsku3wyZprHd
XpLBXInDZLVedjfQCJT//vbxOZEEVjcvguWctgb08Fta09HD6yvwNL5bep4j0WCM8rwGb9KC9mdT
xreRtGcCpceeqYGp58YCYCFETSsdEJopTZG/UzoWAXYr/QKQWmgBQvDaP+0Av53TvhsteH1LOzUg
GGjwNVhRjhPy4un37REZpeOczoqg/PXx+fTj5jdM2dnmQ/vHD9h3L3/dPP347ekRvSp/abG+gIyA
idL+6bYeYVZQr+sIYgD7InaZSjFxNSOWi0u6CiIST/kptI8ZRVqUykM/JCSyr770o4pkKj8Ltz5Q
FrLD1kKmGBRudaX1Be6yr/wJV8IrcIwA+kUf7YfWMXWkClATIHK0PR9tjbfqjk5o5OlJmW/yanv8
9q3JpdjaPaoYulmcUptYVQIEYNfIrHYYZozKnSwNajD55++aNrYjMXaOuy1a+urpbev4Yb7c1aly
fATSmvbquLGHKBPNV9gbP1H5+3UKGc8CKhTM0IOP+rgN6ORQ3pi4AQWp/ASKj28wb/a+Z3PjYo/w
0RYo6XK3GssVnw0AxW0J5AkAYx9ZjvqyoI6Wnfx4bzqMwo//Y+zKmuPGkfRf0VvPREzvEOAFPswD
i2SVaJEsmmAd8kuFxlb3KlayHJY8a++vXyR44Uiw+sEKV34JIHEQSACJTE2DGM5peWl44VvIz0/g
IEeJpCAyAK1C1bS1D078tI2HJyWwbyX75Jyr5VMBmDMVyEnsaeC12p3U/ZAcFR55WrdUW0Emb2cY
Ns43szx/ysDM76/f7RW9b4W0r5//B5VV1IyEjF0spXOYPGQUkZvRYh+sQJ1xo95fRbLHG/GBivnl
i3QkLCYdWfDbf2mW+pY8c/XKBravSheVDeh66m/430KY3HJbwBhoe85wqfBAAsUA65YRhTv+SLvZ
nJA6a6nPPez8eWLhZxJ6Z6zQTXovtpylwyPdyCQ2DV13fywL/ARuYqvum7PbMGuuZpVD8OM7R2iG
Sa5uf3aZA85ipU2zb65mlRV5CvEg8A3M3L5Fcyy6a0UW1d0tnNNdK7Oo67Lnm0PnCNcxsu2KumzK
q7mJbfJVng8pb/9CuwLDtiwq3Apx5ipO5XXp+aHpSl5c7/K+3NmiDZ5MxRzx9vB28+3p6+f378/Y
MxoXiznGa9gkpvqXKbufB3Hlhw6AuYBEuRuDmW04mNYJ0u0khGwY/VKGhKocl9E5opGo7D6a77aH
ucHUGNWs+D1XQ8hKWmacy8zEyxE70JDwOD1N68YYVvbl4ds3odhKARDlZahMnbdoGF8A81PabixZ
4CrjiiCzNqndjwFDidqBSKjesIjHZ6u845npd6cqaL9Hm6p12TrcqK60zrCOiaXi9xGFKzij/dRi
iBeAHnsJWGH0IiDgkuRCFHMTFRFpDGAbE8bORj5Dy9QGa9mz2Gpa7m5aAfmE2M10Khvwb4bfVEoG
TqIsYGg7rrbTvPWS1Mef38Sajo6/lVcKQ93BVN3xwG9hcLjYGe6C4dwEdZ+wwLFnNWebbVmI2mpI
uG/LjDLiqecqSH2H73GbX2sHUARCfJst8aplsb9SyWGedNYxreqUW90/2KMw7DxqwRNCjdHXf6zP
LNIOlOwKzmF+rg2AlYMVybDpXe8Ah4qLhdThAHrsxnL6EFeZioGL4qcpkqvLM5+ar7KVEERYC8A7
TasFtNlt3oSqDYokk9kdn76//xDq7sqclO52XbFLIUy6OaRroXofWlR+NOMpXxkXRpZPfv/fp3G7
Wj+8vRsdeiJTsEl4zLLHe21hyjkNEseDZI3J4ZRWZSIn/Khl4XGswwsD35Xq/hypqtoE/PnhP49m
7cdNtlCs0WCLEwMfTv7tlFBZh8WzzoNtCzQOophP6UkjB0AdKZgXqgNJS+NjJtc6h2JvqwMuAX3/
knWZs3n8a1UPvTNeZMw8vMiYEVdxrPDwCUFnIjH6UelDRdGgZTzCruDohc4crbCtNLsdle48QdCY
bk+1ejvS5umA2/vaNM8gNK74DDRfyDKalUyC39mKXdMO7gfEIu5FmHY65nnJTtQjilI+0aH1I8UA
TaWr3aXRtd7SEOySfWLgG0XTniTXiIP3n4FoSbT5SOOz6hPMAEzTXRO+zT+uCDdx5f3lILpJtPul
OdZoPeFVAPbZTVUSDINPbCyp8STfYACr8dgLkHYfEepAqK5bTqIIFUqMC/0xosFS8hYyVsWdIJEz
E3VdSQxKEY3tXtXNEpb8ZPfaQNX7UUgcIsRxlLjc/ylyJtjjgIlD9G5AQmVa0oDEwwEaIlUDIFb3
vQoQusoIWeLhKRKGFM7rjR/EWIcOCiPq6mYaD7v0sCvgopMmAbE/o64PPd+3y+z6JAhDmy7Pz4U2
1OZIBfIkSULF8tyY7+RPoWDlJmk87R6264Nh2MO7UHkwm8XRlX4eB0TxHq/RGUaviUe1iUqHsA2t
zqHsG3UgcQA+weUgcYwCCQ08XMBeVMrhmUjjwWZ8jSOimKwCQMMVSCBEReK+4xH5wpHFEV0V6AwB
RRowcBG6aYUVc8fAIetqOXfEu8qzTWsS3trrpilQnYOXuW53j3QPvA7ldYa0knR4g6TgbVHkCH9/
bpGBkYk/aSm+r+EVmQNt1bdaE5jziCICQPQIipSUF1UlppQaQeSeV7czH5AyvBPNg72xnNs4JkIx
3WKJ5TkK3WLa0cIS+nHIbZG2PLutc5u+q0LCOFIHAVAPBYRek9qNJ8jIN3Fb3kbERxq1FLu2YVZD
Wyl0ORBb+rEwh6uZiXGUNNE/ZIEjFMjIIIZ3RyhdFwCiUaYuv58Tj1wr1ibEgSO2220ETN1Lg9HV
SuegdsODpQ4JkeEMACXoqJUQxQ09FY4gRCsS0AiZFAcAkQP0LhpjsxggkRfh20iNieAeIDSeCD+b
U3lQ3Udh8EmMjW2IsBLha6SEfOwds8YRIJ+SBLAoORJIkKVwkDDxsC6ts9b3VpeVujp3xQ5WFrvI
PoPHYHaBXSwmDR8ZW3XkI0OgjlHeOESp2GdSxwwdsDVb/ThqhhbMsAFcM7TgBFUxBH19chEMuNKt
MITUx/fmGk+w1nkDB1KdNmOxHyGDFoAA/+6aPhuOfkqOG+DMjFkvPiukpwGIsW4VgNgOI6O9abM6
Vneli5xbFibax9WaHh6sGvBNj1pBz/htj898Alj9SATu/7SFFOQM/f7XrM5m7aEuxLwSr/IUdUYC
dAupcFCCfYsCiODQwm5zcMAZxDVBG2LErgzvgW3jr86cvO95HKIC1GKKw3T6jFCWM3xDwmNGGapc
i5oyhx+fWUtoUuqtzcfAcD6jWkqT+vRK9n0Wr3/K/W2dOVxNzSx1KzZHKyJKBuSrk3SkyQQ9wPof
6JiiK+ih/uB6QsB3Z9Yerm4cBF/EIuwWZ+boCSXoyDv2jKIW7xPDiflx7O9suQFgBFF6AUgIsqeQ
AM0xMSS09sFJBnQSGRBYSeG+fj2LKmZhz7HRPIBRs6b+C56IxrdbR3qBFbea3/1Vy9P5OwK7dPdh
6bIhu/MIQX2VwOKRajvTkQTO/irX65GJh/dpX3LTaZPBVNRiw1k08KYTJN1vt7BBS+8vNf+XZzJP
5ylWUaeulA5tLn1Xoq6oJsa8GMxSd/ujkK9oL6eSF1iOKuMWtp7yMeJqfdUk8MAXPBC63sWPSdy5
I4yr8gLDJm128s/VMv+ieBD9IjXj+ozuAiGiNBilvjw8o5aoMvad7NOsSh3zzMDE99kl7/lUKj7O
BasfeOcrRQILls98A7KalyV9druaGd4Iyh2ncpmB5jPyndI+u8336AwBvpv2nJcb7YUvV4xwgYWD
oa2GwxUyeFPFU0+oThzc8gImn3sqKZdJw2LD55aFzXHNucnqFJENyMohLTANtchKB/eMa5cTM8DR
oAQSX+phJZ1kBw/kWY0b62mMK5WUh7uzJRS8dPnjx9fPYCZqe3Ue09Xb3HiGCxQ4dCSGBi1HVxuG
qPt1mSjtKYs9JDvp1s3T38NKep6EMalPR7TWMs9zS72zy5nadvYueBksxxTAtJ5baOaRicwGLOQI
dhAzo+rNw0xkoVmnwdbO1UaWJZ5sV3mxZbWOPCOkK3UfDxF/mTT1mG2m+RaN6D4HJLVqcO1dtl5G
/PG2zyFQ3dKIJmqmYpdzaVNeZpheBKDIDF5oGXIMk+LHQ9rdza88ULmqNjPt6jTM+bpoXg5kB2S3
PUycjlils0Dw0F7qOn+Fzxn6dGZrHa+bJMdHHjksuwD+kDafxHSxd0UcAp47oXM7zGIBZqyt8cBy
Cxqa34kkR55bMDgUC8IY29yNsLxV1AejpLLAN79WuASNzbEhyegl0owmeKIEs5+QaB/5kWfWFagJ
vsmWcNFsKdnUro/BsG5SkK7osSAPAE3XxtrUO9Kcfo9nBudnIku1TbhUdLicNJqty8I+ZPhxFOC8
yFyRxCVcBnFkOtCSQB2q28uZZFxfS/rdPRMjSvNpk27OoWcHhlZT3fNMvQ8FmuanzHAECXjV+kmA
zVMDyGLGrAyr+qBXwzY3hItj4oWOEH/yVtlx47jiM0sWP5owGkKN99S2qNKM0qy0ZGeOd4ozQ4Ju
2hTYWHEmKrbUCkxMOz5+KtKfqsDz7a5VGSCy0FrfnypCY9+KZix7sfZD1CZDCjbYdhpJLBNsXT/p
yk/7JnU6JpTy1CxwXFaNsE+sVdViCb1rLEmCueySYJYnfnC23kG7tMMpLQRyrqQ55S+LNCubFrAt
z4Vot33Vp7sCYwA/Awfp6aXhh7pQ/AIuPLBtlLvGhUt9UT/ziQVp5xq+C1ea9YxF2Jqh8OShnzBM
3lGxRaFBUUYqoOi8dtMN+t4LJqptDY2y6C+nNIyiH6vBQtCeS5vQD1WVcsH0mXmhl7xKfC/EmkBA
EY1JiiUTX2LkagKYiGPUf53OQrFCpWEU2uqA4HUbJ3dcmD7z8TABOk8UR5g4oA+F+qyigSwK8JtI
gyta79NJV8IlYEmIttWkLKEVxwzAcCZGI6xV65axMEERoVnp20sdu1LZeY21kSxNAvUGVIVszUpB
j4x5jkAMBhf7S1wO4+6FSwbcg9e4q1WVXOD+9Kg5nVgYupS3G3jM2JaGN2t4+o33bNcHuH9clWW0
VUOT10f0EGBhmZU2NANe7UIzcpXFJNSEkEQ+xfsLFAx6bZwMqpBq3G1i8Rlr01mxQqVfMQQ0mIhP
nUUnxNE4sserdFNuMBugLjO9isLL8Hb5XZW6AXkHRyPZPherKT4gs9FtEXaUnRVzcYuyAZGNJNI5
tJGZAUyxcWcGA8+IK6qjShZ6RKW5cprQTd4dpV8WXlRFNntdqR+/PD1Mmsz7r2+qG8hRprSG45+p
2F+mzGmTVnuhYh6vSp6Xu7IXGszCaufWpfCoBsnJ4ON5d7W86U2hUpqGS2N1VZL5vZ/VJlPCY5kX
Mg6c2fziBxgJVmrT58fNNBDGtzhfHl+D6unrj583r99AhVQae8j5GFTKmrPQdIdGCh06thAd22pn
pANDmh+dZv8Dx6B01mUj58RmV3CzkP7QqKqmLHN7asSnYYi5OWzhPB2hHuu0qvaZqkdjLaEMR8W5
j9VOZnNDK9udh+Qg88+f/nx6f3i+6Y9KznOzQYfVRqgpBWrU6BGSNz2LRk5biJP2LxLpGYHHfTgl
k62LzROSqQCPS1x8kOW+uVR7ziHiil7KoSrmbcNcTaQi6vc8H1gPtR5d2Pzx9Pz++P3xy83DmxDk
+fHzO/z//ea3rQRuXtTEv6n+YOF4f/AWYg58WGaXb0gWd3r89+eHF9utrFyR5ajKqpRb0QUVSA2Q
hbQccO+4UFsWYYBUh5Fq8iIl649edD7rxF3FVMu5ObfLpmg+mlINSAahUdckuWRtmRI8cd5n3HNE
WFq4in5fu8MjDjzbsinacl2QDwW8cP6A1e9DRT0v3GQ5LuedyD1zh0gcmSBkM+6EaWGqU3TEKwxd
EvvESzEpmxPzzriE+2NIsE2FxuEHzsR+cMH3DQuX2D1TDz+/1JhiH7UdMXjUXe4C8UKzE1GAJhGl
U4ZXYEDdIS5HLtFBZ0wLMljQEQJ/Qg/9OAYIF1tCoUNqCWJPhk0e5sw7cnxZ8IeEFLc4Vdg+Jo5H
kgYPdiqtsfiukcnBSAM7SdJYCPFDtJIwTTG82Q9NWx2syXIA+4hcm1b6veEUDeU5QJCjVen7Iwt9
ikl4zDyfmlPsgIiZosYlP5eddK6aldcmnE+ZjzoNllGTTpmZvSCthFqdONbXl3ElEjO6UeFPnR8F
5nIi+vVUbDLVGackUyrfKgwmEl8fnl///OeXZdWGB9vLCmlqbgePUezeZZTsTH2iiqGRL52lKk4I
6EpGor6OtOg7KnXkNzUnXXRVU1HNHkaCeeI5k8sNhP1RX6xMUMpUgZQEcpHHipigwafdPVqa5EBK
E5AXYwUe6v7iEQTIzoZvOA0YN0To8JsY64Si0YcWmcRO6WiXfGxjT7U+VunqJzjRdy1r+Z1Nb/ZH
8UXDf6kN9j1Oz/teqA8HrOIQZSzF7ybmTt0mnoed0E4MbdYfg5AWSMEniEmC9EMpH0NdelTYI5yW
YMKmn4SaiF21zg1QZLdNyVNXAx0RGlSPID0DdB+jN/e8KFDxDlGEnkWr8quHlnNzFBH1keFaZCRi
yNgQWjDBBKjqgoaOy7V5AJ8rQgjfrojZ9RVl5/MB6Zvjht/dY0V/yonvcHsKLHJkXjaHfOeI5L0w
5WjsTF7zQYLO+Lg2NBP72qo4Z/vW9PyI4StLDLCn3LAsVvZF/4Ap9G8P2oLw9/XloKipy6XJeNIh
tmfXTkOyfQ1PWcdoGNNe7fPrywtcZck9n+tUApaPgFjrTX80t4RjxE6xT+lq8FRqnwZQ4yRuoSNH
H5JeF/W+5WiK+WDBgvJaaE47dx8r1nk1vB5Im/2lznstGvOCdNhYEvIuJ0yDmRm3z2CydFtcsqzE
T/0mnrxoHJaeoz4g32riDEIM0URU/JukcA5LU1xnhvJk7Fpubib9HE118DSQHr5+fnp+fvj+C7Gs
G84U+z6V0VMHW9ZOOkoax+jDj/fX3+fTi3//uvktFZSBYOf8mzmWy268Xh/0sh9fnl7Fh/f5FVzm
/OPm2/dX8QW+gbNK8Cn58vRTk24a9+khV12+j+Q8jQNfO6CegYQF+IQ6chQQFBrdfigM1LPzrnnr
u+7Jx9HFfd/Dd0gTg9gXYyvzAlc+Ta3qVkefemmZUd9SKg95SvwAaYpTzeLYXRbAfmInO7Y05nWL
qUwDg9jR3l82/fYimNSDxr/Wv4MPwpzPjPYUzNM0styOTa4J1ZTLSa+am/4150d4jGxXcwCwu8MF
j9TIeRoZbg9MxR8ghnXECEAaZ3GbnpHELEwQwwghRhbxjnvw4NQeskLxEAJHmAo2N3asBV1VyfYy
BFfN4stDPrwRWa1lf2xDEiCLmyCHSCf1oGx7uMHnyHGizOEFaGJIcD8lCmw1J1AJIs+xPfvGq2pl
DMIof9A+AnM0ylaNsc1kyALNW50xqpVSHr+u5E1jtCPVR6HK8I+tbh/IIT6G/QA/AFE40Mv4BQ/1
51EasDpw0jzxWbJBEt8xhpoMjh15yxn1kJadW1Fp2acXMWX95/Hl8ev7DTiZt5r40OZR4PnEmp8H
gPl2OXaey1r4z4FFqIXfvouJEsycpmKRGTEO6S2+9q9nNoR9y7ub9x9fxZK+lDCFEjKgQXd4evv8
KBb3r4+vEAXi8fmbktRs4dhXX+6NE09I48QaXlpwybFqvfQPnntUbbyV8ofWeXh5/P4gmuGrWF/s
A5JxbAj1u4Grycos9LYM7Ym1rM+UWBO+pFozM1BDhlFjNAekKeqzT5DlF+ioddUA748eTbGpaX+k
ERpke4FDqxpAZZZokorMAYIer6pW+2MYBfh5/sQAz/+v5OBwJqMwrDVPGCWo6LHYZ68ki2NqTcuC
GgVI68SRPXFCDhgvQ1bw/TFB800ibA0U9Njxln5iID5DY2GOixaPImqNyrpPaiOatQL42H3LghP1
rmUmt56PkXvPQ8mEILqSAI4e6rtIwX3r3h7IBFtceOf5Xps5oqAMPM1+33jkGlcd1vsKu2kb4C5P
s5pavdp9CIPGqj4P76LUWkUkFVGtBD0ost2KRh7ehZt0a6fMMse+czjq6Flxh6vZ+Pwqp95K0Oy9
5LRMhwzbOaV3sR/jt0IDQ35KYvRKZ4Eja7oVVObFl2NWq0uHJp+UePv88PbfzkUib0kUIq0Oltio
+dYMR4HmZ1cvZlh229JcPJd118T0bflkDDIsdz/e3l9fnv7vEc6z5GJtbeMlP0SCaSv1KYOCia0x
kWFcXSjTlikLVPVWO9+YONGEqe5HNLBIwzhypZSgI2XdU+/sEAiwyFETiflOjKpbKwMjvkPQjz3R
7i5U7DzdMaNYqF0H6VjgxOpzJRKGfA2NLaO1Ec2CgDPP1QKpUHaicK2fiaMy20xM844GkhhdwRzi
jCU6UhbuFtpmQjtztR5jHYcbN0cL9Yc00VYs/fuiJHQMybJPiO8Ykp2YFl09cq58j3Rbx9iqSU5E
E+nnChbHRtQnwGdyZOpQ55S3x5v8uLnZfn/9+i6SzHZM8vnF27vY0z58/3Lzt7eHd6GPP70//v3m
D4V1lAeOKHm/8ViiqJgjMSLmhR/cwCfeT4Ro3gD+P2PPttxGruP7+QrVeTiVqa2zI7Wu3q196Jta
jPuWZktu5UXlcZTENbblsp06k79fAOyWeAGdeUjFAtggCYIgSIIAABeTCVN0YVgg5B8GYt9Z13Iw
1ImcqrgiXKfuKK/Nf43eji+wZ3rDlKre7iVNZ13uDXovDpLEaqAwZxG1pVytZsuAA56bB6B/Sy+v
jQPhuAtmfKCKMzaYWpW1U9PiQuDnHIZnynmMXLD2mM43k1nAjGmwWrmjP+ZGP3DlhAaak5Oxw/XV
eDV1h2Ks/KGtosHCkpNdKifdlf19P4GTidNchVLsdmsF+p3NUlAgKPPvDc3EaqkCLhmgw2cQLVvM
WwlrjFUO5N7pCubwCO2qFeto9T7LYDv68HemhKxXq6XdPoQ5LIGuBMv3WALYgJGyqSOvMA25lE2I
ymHvuZpwvZtZDCu71pVLmB5zqw0o/tO5NeqDM0XEg2MHvEQwC60d6JUrf6oH1syiK3CrYWnMXMLj
HJqyx7+K80kAK1NjCx5AZ5PUAtMls33prYD22KH+W9lNURfO6IZb+YZQ+VAc1qkujXGvqL1yiFN6
ZU8AxbeAlQdbMyqVtBwqDVsJdZanl7fvoxD2Qfd3t0+/X59ejrdPo/YyL36PaflI2p23ZSBowXjs
TIeqmWOkKA8TEDuxWRrFsB2xFWSeJe10Ou5Y6JyFLkIbDENlz2GcemNLQ4fb1TwIONghsd1nevhu
ljOEJ2dVI2Tyvq4xJfmKjWLXT5wVr+2CsTRqM1fXf/26CbrsxBjtglvBZ9Nzos3BdUsjODo9Pfzs
Ta/f6zw3qRqnk5cFBz2lxrZy1VC0U1N7zDQeXPCHzefoK2zayZhwbJjpVbf/aIlAGW0CW1oQduXA
ans+EcxiCT6qnNniR0D7awW0JiNuQ6f2jMkzucpyn0sTYe1VMWwjsP9sfQUKYLGYWwal6GBbPLeE
mPYJgSNW5GRkNXlTNVs5tWZWKOOqDRy3o02ap6WblS1WviEYRenl6+3dcfQhLefjIJj8xqdfttT1
2DGoauM83WfsU93t6fTwiqkbQXyOD6fn0dPxP/55mGyLYg8q+h03BNfngIhkL7fP3+/v2HSZYca9
BNll4SFstCxwPYBeg2T11nwJgkh5I1rMnVhxIYiSRk/yjr4ZNeiqbkg0rnuUEJYi0RdctpgLWqb5
Gr0zNPYD7rqQfX5uE66+gWoL2aK7cJVX2f7QpGtpV76mt0Zs0DGjHGZqP8B2MDk7AnmLQrX8HRsi
s7Q4yA16tvTtNhhF6S7OacP6y7MRaBnndEv7SOVwB0OH3V70BaTIJ4uZySVKf93VdHZ0tTKXTxtt
Xydo2b58zVSLfFMYTmDDXZoGNmttwiR9ZxzCIvGl6kZ0WW13aejHi6sJfz5K3IfB8SOvPU9Z1Ljd
ZGvem40GvQh9UcoRvU34GG3UX+lxCwRckYVZ8A7dT52fblTFG/YFF/ZGNC2l3dua8lKHKn1zvwK/
Pj/c/hzVt0/HB2NsLYxOIWpEooeCOFO9YAziFz0dvdx/+WY4ZyNzyC1ZdPBHt1wZK5OOTWpdR/tp
mxxK2zLcCT4iGeJj0cBydPgEusM314tJsJ2aB/XE36jq6HTb812eZmG8tzVVm7wjYc3E82KklxO/
5HqyzyNOhjsrbr3Onk69zcV3zKCXJTeoVYPpk0mxHj5tRXNtlcKcoU1YJtVZ7a1fbh+Poz9+fP0K
aiSxrxLWsAoXCcbTv9BZo+t3K9Z7HaTzbtDXpL2ZziBR+LcWed6oV8QmIq7qPXweOghRAHeiXJif
yL3kaSGCpYUIndal5RGyNxVZeUjLRIQl33qqsaqlQTRJ12nTpMlBD9axRrso3kZm/bBPTPvVyKTR
ipza1IoyYwfo+5C6nYmMiUyiGcKKF2Drgnc4wg/3UdoEfGAAQIeN8UQGIbC8AX94VUlDJVsvEuwZ
T17ENW16uVjEKHUzPXYKsjYLrdGr6rRE32AvD+QkoVB6PnwJasIzQQHbiJ0XJ3wuBIDL09V4vuT1
BcqDP28hVupfn3Eg2r1PEymslxO8zxNiHC1kYIWXuT7VhnxNK5hwgvdgBvz13vPADHBTnx7GKqsq
qSre2x/R7WoReDvawhKY+mU49KT5pqnkJRqDpSVKTokj8/roawZDCxlv/T20bBVN4CJY8Lp2NtcT
89AoUIyny9KMEpaChJVVkVp141lC4J8N6tbViy2WE0ujDDfG3KJCuiq6vfvz4f7b97fRv0Z5nAwB
Ei4bp5484PpX3CpGxqWHiNESPffQKIyvc5FtWvMrBn/dJoF+9HnBuLGhLjhKjcQy4lKG4ofc5Cm3
5l1KyRA2ZaGnlqRerdi7eauMfoByQZ0D7TC4IZIWWy+FhOLeRGvNvsSVcWkPobgY0r6guZe6d/Ng
vMxr/vMoWUzG3CmvVnsTd3FZ6hbnL6RsoLFJCiPiBRivFSvPzgZ/oCCrbWlGpDfzWpPMb8AKcgQc
gBdWwo9Lxsi2Scus3RixXEXShDcMF7YOmSEp+3CI9ny8w6M6bANjM+AX4QzfqrGyTeg43lJ4I6Z6
hW+2ndkGAh3Wa6sL7iSycaKxCEk99BJBtmDM5Rbn0vxaGLmqFLStamiEp75IZFFaYiMNWnjEQtlI
DZiAX3u7gj5dmYd+XG2z0OpOEcZhntvU6c7bgkEnW4E5e6PxXPeoI6R6H2UCQT6yqmwwbryx9xmg
FiOMjqSF9PMpzUOHtRj8p+JOjxSycsp/vk73nuJZWkSisYV43RQ2kSyHzU3lsW6xwKbK+ffn9HVV
ZTkY3WFhRD1EFGw5wzwRVgvaxWpqFYRO0ESwoPvUBGxj3ATHdvtvwhwE0tv6nUhvMKQCd4xFDdo3
tK0z6xL47MsCtRbgYxg1lny1N6LcuON6nZYSdh5txe17sEAeq0y+BrE8TWxAWe0cIUCmvKtoyD4s
YIR9KqIADjY2B4pwv4YV3xoU2IeR6FtlBcYsr9at3baiKkH3emW02OatYIa+bIUNaERmE4dNe8ob
koiFfTtmDQDh5swGKpGWwJXSaXSdtmG+L3njjQqA2sLVz4uHqY0M5XN3UIkGtsmdzVr4xha6porj
0GkhqMf3ui7DQm49eSwID0rXj8THjHZ2Eh3fpqGjQwCY5hLWRzbmGpVwI2VQ/wo+ojjNTIz6B/th
btdKJIuwaT9W+57uYChoULVU6vNTuPMHlIdMWduSsBuYuIU1yzfNVrYqz/wFo0OdirdoZxxqObVU
WrD+nOopO5VCiyuHwzdCFFXLW8qI7wQIsxeLlSBD/AX2CRgXnt0wMZvy3Rw2Wy54DRkQeW0tnUVc
B0Ew0e1HzmoiswlfWLPmHD7ndmyxWk8C3JdQ1zEGsegEzaxfTm+nu9ODexWGH15HTrglR1OeW/8L
unaxs0073IKwHcS7CdVB4yrCJUDpUoTcWGTObVcB+KEAkuOvOFgS6nKjSEZyrRCSuWwrQALWfsrs
5wPSqExjdLWJxQEP5cB+UKeC5qA6gQEpjgI9lL+IA8VESJMDLRA/zZHc5rU4WFnyDFJlacUApggO
TQwdDeVhE5tSZlZqJT5RYSNKWE/i9FCmN1wISuahFMoKE+tOBTFQCZHwMFN47k6w3BoqE6VoaQER
nhM6IvirmHc0KG1msgMAsFxVyTZucyFbu8+IToSk9FFpB6qvxExTppZwPlhLzsjth1LSWGJGcACY
wTRVBI62gt0LLN6JynX1f8E/jNlbDls0moen17dRfLkPTzglEC+W3XhM423pgg5FdBNziwMF7+jR
ZgsJ2lRVi3w4tA7LCN+2KCUStkXvEkcpc4mvZc5AN+wBDvG82waT8aZ22ypkPZksOq7vaxgp+Oqd
7lds96tzW6jt5uAPOCl9QdAqpivmrH5/TLaTaeA2SuaryYTr5RkBrPBH4mpW6ARytbTrNQohEcxZ
9G4Bq+MOnuI24D2GozhQnNWR3yh+uH1lntTQ9IitsQdTszTsFATeJFaptjifbJRgZvzPSMXOqho8
sP5yfEa/jtHpaSRjKUZ//HgbRfk1qriDTEaPtz8HH/Dbh9fT6I/j6Ol4/HL88r/Q+KNBaXN8eCZf
o8fTy3F0//T1NHyJvROPt9/un77xsSmLJF6Z3ooAFbU/rQLN7KSU3ANjIkgsT5rY5IQCV66mI0QW
esPbnMskmAigqXJ3COuH2zfo/eMoe/hxHOW3P48vZ+95Gl4QnsfTl6P2VIeGUFSHqsz3pmJObuKp
Lc0Io8b7FwEs4fbCLnHuw2BTmU1XalSzFOzvHb2lWhbWTqw8QPC3ZzR+G3zpm3I7gEF7Le1ooQo4
AZM7toewL69ym9kjxJRTfBr4wJLyDzYOKHKHOx4kRSXl0pNvnaYM7KaYdH5I1TQhWDWQFkJPmdWD
goXN/TDZtltfAD+Z7mSa2bZWVrXmWQWBbYU7BBuK98tYfz6lcJTPzxq2hAxvE7huEzGclOmtxjNN
sDpqXP7PGIIeijWsj7AJQxetzCIHdhT8t8usyKa51fa2CcGK24mooUQhZjOrm7BphA3uHbqsdV6C
8JBCX4uu3bLZXZQs4Xn7+sYkuYcPrGCG6WdiSmeNLJoZ8H8wn3SWkbqRYO/BH9P5eMpjZkbIEuIG
Rn4ExqbNwXRTUxMyrOR1utdtrPr7z9f7O9jVkULj5bHeaNqr7MN0dXEqdjbX0CCn1ADvzM3p2NhV
vtMI/Us1m5361Bx/PyqlXgh9It6xss2i3kC7qhT2Ew+Tb0wjtsf2q+ah3BawjVmv0avhUq7XEJRM
RlPUxIzjy/3z9+MLsONi+5oDMlh328QJ0pk1CP2lLeTpWd2FxsNPWhZ3fT0WbGpNPEyEfWUJd5TE
/cfmOsSuPViYMTthezqfTxdWr7QCZdoGwTKwv+vBGLDMyw4q40mgQdysrnknPprQWTB+Z60mx1nH
5NSlnh1oczZHsGWuK2kcX5MEuLbiIFN2QR5aRbZ+WptHNQp0MUDNpZ3+XLsbZOxXdvvl2/Ft9Pxy
xPAkp9fjF3Rq/nr/7cfLLbtZxgMuP5db/nCchudQxr7NqJqGa8dkWcMmH68M/LOb5VjmZUWCOSn6
QfKSHA6JDGASZfzVh0Kr0LcekngiqelETax+zf5LRe2+Zl2EqQbQS72DtW0/IUr2Z1a4y2Y7UfCZ
CNMC82Jf6xkjFMTKFnuEXcZP+XZ/9ycXyq7/ZFtKjAIIxsq2SLlP/UcIl3YOxFqxLg4e79pzoY90
XVIepitf1Mi+YAPKkOk/ni7hOYnmuoGnJk7Y/gv0QDc5bGVaIbqNiau84q5eqVzUoKFSol23uUFb
oMzSZOAZ+mc4bKbPKEXd2GkagbkODtiF+YaZwJgO6Z2v6Djv0SSEORBnDHDuUs/r+ZiNZ91j+5xa
ToPmHd/Qeefz0ziXWegvwAl6dpfRgZe8dSY8SmDxcTvSxiHmAvJV3Obx/Mp4FkrgS/Ise5zoAYw1
zLSR/+Ph/unPDxMVI7XJolHvpvPjCR3pmfP+0YfLtcpv+iRS3UHrk3ddVy3MO+CEH4859vzYUsTL
VeQdX5X80jliPoujCtV05kL7cv/tmyvt/emlPT2HQ81WGBflBq6CqbWpjJMHA1+03KmXUWSThk0b
peadoVHi7ODzK1JxvfX0IYTlbyfavbcOf3JjvdRwwm1eOxF/75/f8K3k6+hNMfkiUuXxTWVK6Zek
0Qcci7fbF1ixfuOHgjZ0Eh24Pf1RWZS8bK9Dy32ALwaWIB+x3iKG7kiltzKKXsoQCeM4xQzuIhcU
Q33wQrr988czsuL19HAcvT4fj3ffjaAxfAn92mgtShGFJSdaaRLGB9A6eG0g42arPawilHNF07Qx
mpwmoIgns8Vqsuox56oRR0sPy9sEU5vzdyiAgv2QGxBZ7suYtmd6LfKG4JyJougYzxMIciiqXdo7
4/vahsWGp1zeDmAhmJE1H4bP6sZ5pLfdcLZxZiOeZuT6fdQmmc2Wq/GgrGz4BYCBPvXkHer3gYZt
/Nd0ubIQw53KuRvxOswmwWox407sRZHhu0UhDkbr4Edg2CJ12NAjixpfUzB0CN5bFGAASWnkWVXY
CK9UBtw//6m1UDEHFo9D5XHH0otwTjgaXnm96MmqPW3eCsOXAH4eYsFXj7gac7xlaSmaTzwxEJi0
6EvYhMPUsyHHfGxpE1cer3OqOBaD96K3DOgu9hQQP2+2VjooABbrReALMdewgac1tH7j2r/QKtJy
a8bnJrAv4XyP3iU1dzTcYyMMQF4ZSc8ITulFHGhRmEGjz8Dhoc5wo+u0ncKZg/ykSX9Ko5GBBuqs
w9/o/M13io6lkRPMpfHdy+n19PVttPn5fHz592707ccRtiWMG8AG9mPNjtU3v6JyIZI16T7yuIvI
NsyEx7uoWy20OObeJIx1oVYVXb81VZGevzUetypcBeYyHojxlz3nMi2fvR790w56BOYeYGfzHsB5
/Q4VvA9vK6OJiLiOyGfvXQNroMA8ID5XjZ9GIbcJG4rQNnct3d4oL53NNuIIy71kTywID+Z7Tb6E
mS6/Gsp+mlakeR6WVXe5p9XTRZKZfgBbts7ZDId9AWFwUW6bNabHPksB52oUwsoc59rmH37gRSRM
9ettrS2EfUEYrBRWH2016XMtmETOMNwEXc30+McaTor5dDbxouZeFGxAubriJE6XejRpHUexBMAK
N8byglcpgzkW3chalHlFJyRKNTyc7v4cydOPl7uju0cHYumuPYgVPt84t5J+Hnoql5JRnpxLXoIF
cPQ1aQhFHnneYQno0JZLj0ENb46Pp7cjxoXnbtGaFF3iYDLGrLpjPlZEnx9fv7lsaOpCGi5EBKCZ
yjBZIUs9ZTNBzuvbpRlGdZq04xOHG9G4N4cSOvRB/nx9Oz6OqqdR/P3++Tc03O/uv97faedPynPr
8eH0DcDyFBs8GjyzGLR6MPRyuv1yd3r0fcjilYNAV/++fjkeX+9uYUPx6fQiPvmI/Kqo2uv9d9H5
CDg4QqZPFEgnv387Kmz04/4BN4dnJjGk/v5H9NWnH7cPmH/F1zIWr49uDFt9Z2i7+4f7p78cmsPy
ickhu8Mu3rICzX183uf9LZnRjFpan9dNyhmjadfGtKlQ3P7rDXaPg+8Jc/ypih/CJD58hLWPned9
mbUMQblyD7H6Av0Bnv1d79xYttPZFRccoi8Guns6nc/1WXzB+FK/6yVWM00FXhDmqVgP73O2O+C2
pNwEbhuadnW1nHIWa19AFvP5OHAaMFyLcohYM23s+giNCZemHj8DzN7TcM75QreFBdrSyrD96cIO
ccQVRavYB0/LDB++c1g8Vq5KPIpvTPz1WqyplAnuT00Y0xux6s+1ZL8xOzPUKtHf8lxE2wZjITm4
dfIsQ/zwpaeV6S6lBwdKdd/dHR+OL6fH45s1o8Kky6ezOVqn3FEQYvXIkD3AjJYfFeFED2kKv2dj
57dtAIP5DMJLp03cnjcJAzM3ShJOJ56cYAWYuGM+oyvh2GCUNBa9wUqNGGJIGAyFfZJCTsNOSA8O
Past/HUnEyOEPgFsNmvY+OP1ZOxJ41nE02DK9aEowuVsrgfFVQCb1wheLDxTswhXszl3zwGYq/l8
4maxV3DvF4azWEHhgrnwWIBZBHrjZXu9suKAIigKPYF0LKn+xyXDJkWM6sOdwYoCy8ibYYGFyXJ8
NWmMaPwAC664TgFioVvO6vdBqB1E2MDmP80tSldX3CFHmIgDiAmuX8ZWEKMjjicIZifCFc6TrA51
x4ZNZ73XFWUYdJ1N43LySzdKniryNg5mepRsAug7EwJcGVl8YLGaTBfcMof7moURcDmup7PADRPc
prAJahfTxdjb7qIOFsGVp91luF1ad1JqqVTcYr6gB967UF2DG3cvhJF1IQ7CYPQFvrOG7YIBBCfg
su0mus9TSyXHq4lBhqAS5j4fZAnRBZgaztD2+J2AZSSqQMsdjHb3Fl43NHqYM+/ND30GUSA2MGW/
mEa+g+y3Bs8PYP4Zc2xTxLNgbtR9KaWWoO/HR/KkkhTL31yX2hyGsd70Bw0sa1SZ9HP1XqGoSBce
p5k4lis21KUIP5npCWWcTMcHDmYshNgM0WDkHpnVeng/WUvzWnr3eXXVsUrNYQq3Xqn+SkczM2V+
sfINlHJ8WFVm+Tm86eb+S9+EEZTvgwDqosAX0OvAxIk9eS3XnpT18N3/V/Yk223kuu7fV/j06i7S
tzXbXmRRqipJ1a4pNVhyNnUcW53odDw8y343uV//ALAGkAQV96LbEQCyOIAgSGKwK7WRxoarVyjj
2lHRg15iDiziXXk/mI94pDf4PdW1D4DMZtJ5ABDzywk+dnKTUoJy72MALC4W+u/LhXUpiJe8niwJ
g3I2m0h5KJLFZMpjsoL4nY91Ue3ns/OJJKJAusD35vNzzczx5KApHzGY8fu3h4cujCKfQwvXBkHa
/+/b/vHu51n58/H12/54+C++0QdB2QYeZfdH6/3j/uX29enlj+CAgUq/vOG7Ff/GSTplvvft9rj/
PQay/f1Z/PT0fPYv+A5GUO3acWTt4HX/05JDyJSTPdTY8evPl6fj3dPz/uzYy75eYK21sLfqt87w
q51XTjBasAiztL+8no7mI4eO3y6e9U2ROZRcQgk6blStp0YGM3f/lFDZ335//cbkfQd9eT0rbl/3
Z8nT4+HV3ApW4WzmSKSHx/CRHNG8RWmxRsUvMSRvnGra28Ph/vD6k03T0K5kMh2LcV83la6bbQLU
8CSNEDCTkZ4za1OVk4l80NlUtQNTRueyko2IiTZFVpdap09Y3mhA87C/Pb69qKxwbzBEGmdGBmdG
Amdm5YWWR72D6HRXyY6Hv4/S6ybyk9lkwYtyqMnUiAPGXvySseMyWQTlzuLqFi7uJD1uqilPJwZJ
2epQwBqJVfwc1DgxRZMX/Bk05ZSry15Qg+LIo4Z7mIdD/41JV7UNKg/Ky6kjsiUhL8WwRF55Pp3w
ry8343M92RdCxJs0P4GiPK49AvhWBL+nPIgy/F4s5vq5hSkjbQwkI5JaS7jOJ14+4rH4FQTGYTRi
lzW9hlDGk8vRWIv1ruMmUmIyQo150Ok/S2880Y+lRV6M5mLM77gqjPhg8TVM3cyR7QqE1Gw2csxa
i5SiOqWZN9biqGd5NdVSw+TQ6MlIh5XReMxjS+HvmXYIhvP2dOpI+g7ror6OSlmP8MvpjDIUDgcX
BJ1L9wrdLFQw1HPuskOAC+36AEHnYi2Amc2n2lDX5Xx8MXEkyPbT2DnSCjl1pAELk3gxciVgI6Qr
L2C8GIsL5zNMF8yOpnTpwkM9xt9+fdy/qvsNW1Hwri4uzxkLeFejy0ttJasbtsRbpyJQF30AmY71
rShJ/Ol84giK2IpKqogUA5lp2rmG0+D8YjZ1XoB1dEUC7GdJ9MGwQBqR/+nz5zx/3/8wtDkN3m51
d98Pj9aoMikv4Imgs8M8+/1MZer5/vTIXChxRDYFmV3Kt7Nkk1/UecXQ2nhWKADjLMs7AvfI4xO7
TNV2Q25su089giKkkgI/fn37Dv9+fjoeUHmWBuQ95Jp2+/z0CjvjYbhuHg49hu9LUMICcdwhzY0c
K3iKAXkuEQPGEAVVHqPyJ1vDyc0UuwBD96pt5XGSX44tOeKoWZVW5xFMfQs6g7COl/loMUq0qEPL
JHe5+vANc+k5nFGCeANiSZaEQV66RPwmH8k30JGfj116dh6Px/wKmn4bsiWPp4pomM1yvhAvXxAx
PTdXRol6QVhKGlQ1n3Gfw00+GS00VfFz7oFWshBnzJqWQZF7RA9xcTmYyHaCn34cHlCxxoVyT7m8
7oTpJgXD1BGiwCswQknYXMs+yslyPBGdEXIMNNx3vlgFmOyVKUllseJ3kOXucso1Sfg95yo3kvNs
lrAxTjVV9DqeT+PRrlfH+3E82fvWxuL49B3N+V2388yg4iSlEsb7h2c8/etrihsGXY4WY8exkZDi
eFYJKJnsooZ+n3Md5abUJ48gptbRCWGhkUPJtJJDNFwnoRlNZrjg3mo2fWpHKz5R/gA75g9aNhde
g3aezFDEomdrLff8K+fHYQWGFb5gVkUWx/rGoxbB5uasfPtyJPOAoRmtUajunEtOg+ukBQ6iz0+a
qyz1yNEYkRLTb27Q/bOZXKQJORgzC16Owip0lJ/7HvkEM00ZwOrVH1sTJonO2FqP2DygazrU5Xiw
W9pDs39Bd1JaFg/q8kGzquy+d4KMTYTn9AueWV/2Hu9fng73bMdJgyKjyFbDCVGBmmWUBphvLpf1
r66q4XFqx8LTh9c6IAVGToyfSnPhn27B+JBSBp7N3Zvt2evL7R0JXNsKtawkr0M1n9VGvzFQMKet
b0+Ax/UTlTZrR8VJKaU1GL7Lgw320M6TcLigsfs7fGuVOxITVKEjOEkaYbB7OLhlhdPQNhJP3GUc
JUs9kh6C1MOXXxVypgxScuHfaeiLdqkYCJFsIvoScDxuPtVe0Ii6XcYjA+AvFVWAx5UhqI9Wrvwq
UrciUpfQB3RMoaXM02L4nr8Jm21WBK3zi2Yg7uHuDDsz6Nu5VxhuX920AC4rMauGH3PjGbQ15Oaz
HaRZor1jo2cgiOKQzCBV6oBegqcBeuPdOPBQV5j6xU1OoUV5LH2YdBC6lSQ/V2VvZDuohbYXSj+j
hCGXN+0LnrPIpzqrNDcnAqDxPwV9IB7B93NJtqPrcku/9YpU660Cd0tGA1ZFyB5gPq2SqrkemwCm
GFEpv2LThQG/VuWs4WY8CtbwOVzVGIyX0fhaNJHWVp8TZDARsXfjgGGo0whTXzTwZ/iMRODFW48y
V8RxthVJUXzv+MAz3A4mkjokjDojS0IYlyzvXb/827tvWkaRktYLZ0G1gMrKq0qdBRViE5VVti48
2Ruho3IHxugosuWfOAqxFaSuTw1PLVXb7XH/dv909heseGvBoyFvo29CBLoyQzxxJEhRxS16mRzj
ZiRZGlWiNzPR+JsoDoqQOU+povjmijEAceDq0sD6eY36FspZ5mMVFinnxW4zHZRVvVsEGESTvHMQ
zc6rKvm6QeGBd4JwIb0/buo1LOslb0cLosHRnOdXbWRsBu2jIK6jtZdWkW+UUn/UGuR6mT2/TP+K
SuWeB+NThaJ5P4giEPhXnIppKsaSx9/XE+P3VFNiCGKOMUdql6MK0siPORTRz4j5oJVs14MTjwJK
GbOBVBc73xIhO4EWEqRGX7s4i3WQM89L/g3JhxNWOFpEwaaTcQ892LHMnzga2gdN58KyTovcN383
ax40HQBlSLDmqljq19iKvOtGlAJhjemMUh+jSDi0oLaQUwz5Yb6RA+34kR67A38rcSgdMQmLLmPb
oWV2/iqi2obeFRz5cH3IURWIqs4xKr0bb61tjhz0TwsqX0UMeIwbk2NQdXlAFeE72ldu01/SnOJ5
Pwu8xrFePCoroi5zeTbTmC+HuOzcxz/+djg+XVzML38fM59QJIAGhLQRzKZSJASN5Fy/3NJx59Lj
ikZyoRt8GzgxiodOwq7qDMy5C7MYOVt8sZDu8AySibPiqT7QDDNzYpwdWCycZS6dHbgUM8zrJPOR
45OXU1fXLmeX7mk6l7ZRJIFDGvJXc+HoyHgyH7lRY/OL5C/9i09ZhTqEi5U6/NRVUL5y4xQuJu/w
C31QO7C1bjqEbPqt9VK+1tZIfjUpY4PxrrLooikEWG22M/F82NQTMRldh/dDjImj16bgcFaqi8wc
bcIVmVcZOe5sopsiiuNIfnbriNZe+EsSOF9Jofo7fORj+MRAameU1pF0F6CNTcRjL3aYqi6uonJj
DmhdrRypG2P5jFGnkW+Euh3stvilgDJR3N+9veBdthX3Afc63kP8DVr6pxpjL7o3qDayNkwlloAD
7lrekZZtlcJYtYf8MFBteGAtaoINps1T2UXY1oUoOqFHfo9iD66gd0TVDcYCKOlmtyoiXw4R19Ge
RDo2WRJOlVLDyszOGNydGNCJllyVU+hiTZEG8hvSknwKRsTcbQ0i3iu7hhVUsXT5itnk2Nwydyyp
FejBeBFSZnUh3l2gykfRLsMCIyub6YpFNMZp2Xz87Y/jl8PjH2/H/QvG5f1dZQX+bbhaVQFshlnz
mHYcl8nH39Ai8v7pP48fft4+3H74/nR7/3x4/HC8/WsPDTzcfzg8vu6/Ild/+PL812+K0a/2L4/7
75STck8vWgPDs+hkZ4fHA5o9Hf5729phtt+lYPDQKf8K+CzVYqEQCl31cAId8XcM0hUIGEbJr0Qd
7ejQ7m70dsXmiu5VYFxUWX/V8fLz+fXp7A5jRvepmZn/MhFDn9ZeHnGfeAae2PDQC0SgTVpe+VG+
4SxjIOwiGxVDxAbapAW/SRtgImGv81oNd7akw7CLMYW4ynObGoB2DRib0CaFzcFbC4PSwid6CAJC
mdG5xIL9+dBIxttSrVfjyUVSxxYirWMZaDed/gRCA7262oRirKCWQI+I27FBlNistI7rLhcthsWw
8K0TZBde++3L98Pd73/vf57dEbd/xcx4P/mTSscFYhbXFhnYTBf6vgALNkLvQ78ITtVeJhOr7yD4
rsPJfD7WdHkLiUNgv4C9vX5Dg4y729f9/Vn4SD1H85X/HF6/nXnH49PdgVDB7euttd59Hr20G3Q/
Efrlb0AF8CajPItv0D7P3UMvXEcl8JcgGBQC/lGmUVOWoT0UZfiJwhmbg7rxQJYiQvndk4087iZH
u0tL3x7g1dLm38pedn5VCt+2y8bFVhiibCVFd2qRudSunbA2QbXZFp4tQdJNN/QCkwxIGlb5KsEi
9a534iVOO12YTaaqE+FzGETt2mLFze3xm2tSQOO1er9JPHtZ7aRxulbFOzOm/fHV/kLhTyfCzBNY
PUnKSGnJIRxmLAYR6R6f3U7coJaxdxVObJ5RcJu/Wrgo36Ah1XgURCs3pm2mLTrFxjEWkhEUfYjf
UHT7SjCzyiTBXFgFSQSLNYzxr3vsiiRQEsKSzIAQjbkH/GRuDxSAp5ORBS433lj4CIJhnZShfHQe
qOBTNp1FNR9PFJUtzagKqVnzsSD7Np5QRTKVeoBPgstMigrUbbLrYnxp79rbXPoyMUtDjNSAZO5W
i9o5KTi2vaS9sJQ2/7A0QnbYePYFcylk21XE0yUaiMG11fxuT6H4190ADFMZx5Fnr6gW4VoBPV7t
XiA73085cZPi4bp7IbDkEGBlw21OwJpyqttlJcgXhJ7qShDaAgtg0yYMwq6MPRkr+ntybXlx6U1O
rPNO3ZCkc4v6ZZ9BUc61eKU6nHbKoRMyzYmxYSRsfq2eJidaWG0z4nez6hZuvR0ZaOcE6ATNdOvJ
FxwGucxISgo8PTyjPal2SO4ZYhV7VSi0I/4sPci3yIuZtPfGn0+MFyA3tsrwuaz6ANrF7eP908NZ
+vbwZf/SeVF2HpaGKErLqPHzIj0hRYNiue7iKgqYVoMxa1Y4411LIJFUUERYwD8jjHcbom2ifinE
zoQNnNBPPKYZhN2p+13EhSNSoUmHJ3+bc9TFw/fDl5fbl59nL09vr4dHQUWMo2W7pwjwwreXaPu6
fh0SSadeScU7FatLP36CRsQpiXOyuCKRUcMBbsh/fopMREuSGOG94laU0efw43h8cpR6/U9qaF/V
qY6erME8JIpEDqVosxV2n+sm9wIjfp6FE9mG40thZhDvVYkKcXMCKx39Byz2ZTTzBDmGNL4v29Ay
kk9e1QSbi8v5D19+ozBo/eluJwcBNAkXk3fRzd5ZX9fIa0dsYKGZ7ySFhl5LCd4ZHQsIaCMx9cRO
jrTE5yuhxOfNehc7ZotRnLCU8MqbJMEkoT49QqDNhS3y0Jf2L7qSOVKA/+Ph66OylL/7tr/7+/D4
VbPzJRsdlEAY87TsH1JkQ7B31N11fxmlXnGjzA5X3Q4ZOwUxBuj1iqbA+NG6BZlHlpnCAC8jOIhg
lGJm1dRZxMMZJfXxmaLIks7AUiCJw9SBTcOqqauImyx0qFWUBvC/AgYLmqAxRlYE4skT04VTGqgl
5hUYTG3o2caL7W9gyOcoS/hVTIcywCRj0ejIT/Kdv1GWQEW4MijQEgyzqqkkIXkc8U73dQB/URLc
ynzzgiM/SJSo0hRaf7zQKez7AmhuVTfajStee/zUfvZh2PVFRpg48sPljfwqqZHImhsReMVWmcYZ
JZfi6yngTGXad1R+zskwURNd+Mi07Eqyv7wZTNO8NMgSNhJCHaCyUpIhdNcaxhOhQWjDP+NuF6VK
Of6pQQeVuWs5arZD3T8ZnNc91AI6r0BOYIl+9xnBvL8KYt4p60jyBOHGai088vTpacFeITksDMhq
A6tPKFfmwP3ukkv/T6sF+hvC0ONm/TkSFqzw2LrzisK7UWuRLcOyzPwIlh4oTEQwoHD5wsLnbh8K
REH5NYGAcIzdONizhGHQlBSzrwGBh14WOg4RUAW9o5oWpIjzgqBoKjiZKXHX7RzbKKtibUiR2JU/
lyoCPd3a3RgeG7EMUx+ONgXTusp1rAZxAAWfuNCMs6X+i0uUrqcxWusxyRN/xvfzARAVn1DBZPUm
eaSlwkBHngLfEaqChTMk/bab6+ugzGwOWIcVui9nq4DPKS9DWWW0aMS91M7RjUd7GO1RtXKraFZx
XW4M6/GeiN7fE9/A0PPy1uMhtAkUhLmevwbtF9K1KJiY66axreuv4J3SQdDnl8Pj69/KnfFhf/xq
G4OQynBFI6IpAgqM5ozyI6RKo4gh0GNQC+L+qfXcSfGpjsLq46yfb5Wawq5hxkxJ0Ii4bQpl2pCZ
vc3U7mR2jleBtYZpuEmWGexpTVgUQMUwihr+u8bQdKUanXYKnMPa36Acvu9/fz08tKrakUjvFPzF
ngT1LdhAMvP7CEPXidoPtRdYhu0EYujwlB4oS9BE5Ms6RhRsvWIlm7+tgyXmtYnySjbuoXfopMaL
zk3IT3KrAoaWHGE+XowvJzq/5yCK0aPOkQiuCL2AKgYq2f4lRP9QNO6HNRWLYVipd2VIaQjRrj7x
VI69rhUGhlpq5JBuM5RmhR/2GQ1BTkYYOIK/ASlLktbfKuJXerwGZRLdZ40adP73sg4xGl16He66
tR/sv7x9pZTg0ePx9eUNI/vwHH4ennngCEJ+tDawN1tRE/lx9GMsUbW5GsUa2hyrJdqSpT6lndE7
X9o83JuRn5q71pyf6BJ0vjtRD1rxuIyzSBpfAR/z8vhbKDAI/mXppaDYplEVfQ7xK7w0YU9/zwcK
Psvvmjd9AJSTg8lM6CLyUUvCOFTGRDyK2XBXYWBH/fVB1YJ42vGlsxSWzbap7jRH0DyLyiyVT4tD
xY12OlLwIoO14TW6ytAPt6LZ7sxSHNKf3Cq03h/g6ncn44f2KnCbCMTZXuWaJfBoizh1YNAJ0QzM
XQ1FV3FkwdII0bnnHWSFX5MUfAcpyBz0yWodWH/Zj1amd1vzmEnuuF52xLKhIVGQ/4hrdbSsDSpX
DPLQHq8O4xbpJGxrPf1VCZtP0KLCNDD3IoPPrpMmX5Npp8lv14ndIqBGCwWnjWxPVchBEdg34Vi4
drOi1Cyz5VFR1V4sNFIhTjRARbIno0VnC67wfIBnqdhoQetLVTKKdlfTTkZmLRINk5GekpEyAgdd
P5L4Po2Ewtq32AqLywfV6TQbhDecrrTjsvFhs8JhkyBEVqPvr7S9KHyUxspMTYMSL34c68ChS8Y3
rmq0JbXV/5YIES1lkgV1LNuDW7uBsXA2KpqGsrNBorPs6fn44Qwjhr49K6Vjc/v4lZ8UMK8j2rhm
mse3BkbFpw6HriokHcfq6uOov+vI/Ksa5XEFUoYf1ctsVTmReBrAUOUJJ6MvvIfGbBqaTRufQum4
4kzYU5AMoX7AXCa5SMMarB1gVHMYYW4myPwlcdv2EV/H+LFmUwN7V14picjtJ9BjQZsNMvbMSNyj
qtbjDJxiAeVPAOro/RuldLZVDCVzDZd2BdRPNQQbfKw7y2ahbp1hceivwjBXjvTqehstAwfd6V/H
58MjWgtCFx7eXvc/9vCP/evdv//9b57oNOvyXq/poG37heYFZrNsQxQIw6remaAHllaD171VuONP
VO1qGxJM6WJYJt9uFQZ20GxLhvXml7al5umroOqBTBeT5KgaajmxBmJAOKV/l8U0Dl2lcfjofVnK
6snHCpZEhd6h+kXe0EnhOrr0V1ox6QKiDFT1Ww+kpRV/5J8wh3Z0q9D/dxhAOgnCoGLi8zAMgJ/V
7bGgrCidyXoiUkvrb6Xq39++3p6hjn+H7zjWDQC+CZnTmkvAcm1ClI+MSqQ8iB/SzhrStkEnxqh9
kamtaRLA0Uyzr34BQ5FWkRENVtll+LUkIWQuQM21BOVAghslhgsBH2MKrFg5gT2ognYqtZLhp1J6
8+tidmmNN7sNElUpMQUd3CWG9+CU5d9UGdsiyGhi4C07C3BKoRIBpTkIXbN7htPYdeHlG5mmu/pa
GWwtIJttVG3wxrV8B1kbygOvB99D7hVWrS06oZMIfBZf8wwSDFaBS48o4bSZVlYlaChzYwD9tjZV
Ndv6aIAwKGNjjIZqiq+LaLqINRM5UUIiotciusAfEGUV3tLj9ZE5Fayq9o6i3HI12KqvO96aFbWE
NgutLF5HZYKuudsyArM62esXnOViql/z0/tZqW8CbMcY3ULTqtTZTjVL1JFBuQX1byWQaKpJ37Hh
LnELK/hUzZjiltDSeLbrW7FtaXFemXq5mbDeQHV3gsQgwifUF5awBwGbqaFRjDPMO8eFrsuwDt0+
P2NCMCpnWAN0VLAIO7yjUcThQxV6Y0wGqqHiZagWE6fOVxas4xgTLtdwWqh07dSOoOVNCkxoVoTB
frrAtKU1X60YiFJzw9fJSGQNT2zy7TYTDacpuy/DSRrP1Dgxbh5UXcc/dVFqt9AOgkbZlE0u5KaZ
5LJnacv/lQcbd+4+wfKK/xFxH8WMBFsQxpWY0TUvwjABTYeutDEelK5bsBlHQWtgtZm344rg6SAK
wibb+NF4ejmjl1THPUoJJ8WYLwcF0DPWD0JNIRmDSX3TqNTLmBYzRqHbmVCi9Ve1qMfvBwPXqrNW
4zdbWNWhd0XMbZfCvIMWtE0NG0ehUET94lHFWsT1CtPvoL1WEqBx0dKisI+37IqMAjJG7aNAyMSA
8hFvKQYwxefVMaTP/rhYiPosjR3wGN3j2TuygU8xMKRJE3pFfNO9b2I4z8Fk4WLRtO+OtJPzVM28
lKOuYLl2FKC4g7tgyV/31QE7XtLDtqFM9fuddFTGVqJBBgbblJ+sh7FVK3G0cwWEHigc75g9RW29
BJsUrR+31j/1lIy3K7ozS+65342pYKdiGmcBmtBTfVaDQy9TeS1S5HTRhydtZxPqdKtimcKxg7eh
h6uXVVqMjhDqOv9yW4Fqf3zFwzFe9PhP/7d/uf3KAsHTNSQL0UCNHVKpD5eW4nWlhgx3rbwxTnIK
Syq+4wKhO9Xi83xWtDtuxFPe5YlMpEXbCCsUIyKdvJPRO2j/tVOPg1d+dm1dPJeg9mTXnZRma62l
HkYAydpHFnzH9wp8U5NGgijxibuoE/JF4bYzCgn7nQeiWW3lox+YKKK/cS1AIaLTAAw06UDK02Gw
p7sKKvl5Xd0Y4q5YGjnHdZIkSvERSraDJgpn+eVwNoYVdUIXWKIz3Ak82V5lcYZJ393CCJcKqlGn
K2tfyhyMre7HFjPx+op6uwl3+Oh4YjiUrY9yepdfAzu60s9l0xf1GAAUlRj8ltC9UTAHLqMK1eAH
o6q6jmTpS1hlSOfGY/zNFey2booCbTHpWctN4/RsISwogK6OxlfMxb3rJb5VmL1sn15c9dCFDQVl
MQvCCcXdMrLq3mT0XHotixW0ZYY2/UrTx9pWUZFsveLEOKlYnrKpNoi5ODBFeBGqmC9MZHOtGGsT
UcpSnSOYGS4zJHde1SYB0ol1Q1tLq1Y1C65tvl0UFIWmDSNkSKIw8eEUL56f27J4fR3Z34SSDl1e
zQkKDAquw1c7FHLa6p3caa3IL8p07/8ByI873arvAQA=
--===============3253272020905316506==--

